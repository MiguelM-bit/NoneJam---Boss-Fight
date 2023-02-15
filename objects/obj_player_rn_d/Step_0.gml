/// @description

/*
qtd = instance_number(obj_item);

if (qtd <= 0)
{
	upgrade = true;
}else
{
	upgrade = false;
}
*/




////////////////////////////////////////////////

//chenado se estou no chao
chao = place_meeting(x, y + 1, obj_plat);


//checando em qual parede estou
parede_dir = place_meeting(x + 1, y, obj_plat);
parede_esq = place_meeting(x - 1, y, obj_plat);


//configurando o timer do pulo
if (chao)
{
	timer_pulo = limite_pulo;
	carga = 1;
	pulo_extra = 1;
}
else
{
	if (timer_pulo > 0) timer_pulo--;
}

if (parede_dir || parede_esq)
{
	carga = 1;
	pulo_extra = 2;
	if (parede_dir) ultima_parede = 0;
	else ultima_parede = 1;
	timer_parede = limite_parede;
}
else
{
	if (timer_parede > 0) timer_parede--;
}

#region // controles
var left, right, up, down, jump, jump_s, avanco_h, dash;

left = keyboard_check(ord("A"));
right = keyboard_check(ord("D"));
up = keyboard_check(ord("W"));
down = keyboard_check(ord("S"));
jump = keyboard_check_pressed(vk_space);
jump_s = keyboard_check_released(vk_space);
dash = keyboard_check_pressed(vk_shift);

#endregion

//config info da movimentação
avanco_h = (right - left) * max_velh;

//valor da aceleração
if (chao) acel = acel_chao;
else acel = acel_ar;


#region //state machine

switch(estado)
{
	#region // parado
	case state_rn_d.parado:
		
		velh = 0;
		velv = 0;
		
		

		//posso mudar a velocidade
		//pulando
		if (jump && chao)
		{
			velv = -max_velv;
			audio_play_sound(snd_pulo,1,false);
		}
		
		
		//gravidade
		if (!chao) velv += grav;
		
		//saindo do estado
		//movendo
		if (abs(velh) > 0 || abs(velv) > 0 || left || right || jump)
		{
			estado = state_rn_d.movendo;
		}
		
	
		break;
		
	#endregion
	
	#region // movendo
	
	case state_rn_d.movendo:

		//aplicando a movimentação
		velh = lerp(velh, avanco_h, acel);
		
		//fazendo poeira
		if (abs(velh) > max_velh - .5 && chao)
		{
			var chace = random(100);
			if (chace > 90)
			{
				//criando a poeira
				for (var i = 0; i < random_range(4, 10); i++)
				{
					var xx = random_range(x - sprite_width/2, x + sprite_width/2);
		
					instance_create_depth(xx, y, depth - 1000, obj_vel);
				}
			}
		}

		//pulando
		if (jump && (chao || timer_pulo))
		{
			velv = -max_velv;
			audio_play_sound(snd_pulo,1,false);
			
			//alterando a escala
			xscale = .7;
			yscale = 1.3;
		}

		
		//pulo duplo
		if (jump && pulo_extra > 0) && (!chao && (!parede_dir || !parede_esq))
		{
			//pulando
			velv = -max_velv;
			audio_play_sound(snd_pulo,1,false);
			
			screenshake(.5);
			
			//efeito do pulo
			efeito_pulo = true;
			dura_efeito_pulo = room_speed/4;
			
			//resetando pulo
			pulo_extra--;
			
			//criando a poeira
			for (var i = 0; i < random_range(4, 10); i++)
			{
				var xx = random_range(x - sprite_width/2, x + sprite_width/2);
		
				instance_create_depth(xx, y, depth - 1000, obj_vel);
				instance_create_depth(xx, y, depth - 1000, obj_vel);
			}
			
			
		}
	

		//buffer do pulo
		if (jump) timer_queda = limite_buffer;
		
		if(timer_queda > 0) buffer_pulo = true;
		else buffer_pulo = false;
		
		if (buffer_pulo)//eu posso pular
		{
			if (chao || timer_pulo)
			{
				velv = -max_velv;
				audio_play_sound(snd_pulo,1,false);
				
				//alterando a escala
				xscale = .7;
				yscale = 1.3;
				
				timer_pulo = 0;
				timer_queda = 0;
				
				//criando a poeira
				for (var i = 0; i < random_range(4, 10); i++)
				{
					var xx = random_range(x - sprite_width/2, x + sprite_width/2);
		
					instance_create_depth(xx, y, depth - 1000, obj_vel);
				}
			}
			
			timer_queda--;
		}
		
		//controlando a altura do pulo
		if (jump_s && velv < 0) velv *= .7;
		
		
	
		//gravidade && parede
		if (!chao && (parede_dir || parede_esq || timer_parede))
		{
			//nao estou no chao mas estou tocando na parede
			if (velv > 0)//estou na parede e estou caindo
			{
				velv = lerp(velv, deslize, acel);
				
				
				//fazendo a poeira na parede
				var chace = random(100);
				if (chace > 90)
				{
					//criando a poeira
					for (var i = 0; i < random_range(7, 15); i++)
					{
						var onde = parede_dir - parede_esq;
						var xx = x + onde * sprite_width/3;
						var yy = y + random_range(-sprite_height/4, 0);
		
						instance_create_depth(xx, yy, depth - 1000, obj_vel);
					}
				}
			}
			else
			{
				//estou subindo
				velv += grav;
			}
					
			//pulando pelas paredes
			if (!ultima_parede && jump)
			{
				velv = -max_velv;
				velh = -max_velh;
				xscale = .7;
				yscale = 1.3;
				
				audio_play_sound(snd_pulo,1,false);
				
				//fazendo a poeira na parede
				//criando a poeira
				for (var i = 0; i < random_range(4, 10); i++)
				{
					var onde = parede_dir - parede_esq;
					var xx = x + onde * sprite_width/2;
					var yy = y + random_range(-sprite_height/4, 0);
		
					instance_create_depth(xx, y, depth - 1000, obj_vel);
				}
			}
			else if (ultima_parede && jump)
			{
				velv = -max_velv;
				velh = max_velh;
				xscale = .7;
				yscale = 1.3;
				
				audio_play_sound(snd_pulo,1,false);
				
				//criando a poeira
				for (var i = 0; i < random_range(4, 10); i++)
				{
					var onde = parede_dir - parede_esq;
					var xx = x + onde * sprite_width/2;
					var yy = y + random_range(-sprite_height/4, 0);
		
					instance_create_depth(xx, y, depth - 1000, obj_vel);
				}
			}
				
			
		}else if (!chao)
		{
			velv += grav;
			
		}
		
		
		/*
		//dash
		if (dash && carga > 0)
		{
			
			// Decidindo a direção
			dir = point_direction(0, 0, (right - left), 0); //(down - up)
			
			
			//saindo do estado
			estado = state.dash;
			carga--;
		}		
		*/
		
		
		//limitando as velocidades
		/////////////////////////////////////////////////////////////////////////////////////////////////////////
		//velv = clamp(velv, -max_velv, max_velv);
	
		break;
		
	#endregion
		
	#region // morte
	case state_rn_d.morte:
	
		room_restart();
	
		break;
	
	#endregion
		
	#region // dash
	/*
	case state.dash:
		
		//dando dash
		velh = lengthdir_x(len, dir);
		velv = lengthdir_y(len, dir);
	
		// Deformando
		if (dir == 90 || dir == 270)
		{
		    yscale = 1.3;
		    xscale = .8;
		}
		else
		{
		    yscale = .8;
		    xscale = 1.4;
		}
		
		//criando o rastro
		var rastro = instance_create_layer(x,y,layer,obj_player_vest);
		rastro.xscale = xscale;
		rastro.yscale = yscale;
	
	
		//timer pra sair do estado
		dura--;
		//saindo do estado
		if (dura <= 0)
		{
			estado = state.movendo;
			dura = room_speed/4;
			
			//diminuindo a velocidade
			velh = (max_velh * sign(velh) * .9);
			velv = (max_velv * sign(velv) * .9);
		}
			
	
		break;
		*/
	#endregion
	
	#region // atirando	
	/*
	case state.atirando:
		
		//parando 
		velh = 0;
		velv = 0;
		
		
		
		
		break;
		*/
	#endregion

}

//debug do estado
show_debug_message(estado);

#endregion

switch(carga)
{
	case 0:
		sat = lerp(sat, 0, .05);
		break;
	
	case 1:
		sat = lerp(sat, 85, .05);
		break;
}
//definindo a cor dele
//image_blend = make_color_hsv(177, sat, 255);


//efeito pulo
dura_efeito_pulo--;
if (dura_efeito_pulo <= 0)
{
	efeito_pulo = false;
				
}
if (efeito_pulo == true)
{
	for (var i = 0; i < random_range(6, 8); i++)
	{
		//var xx = random_range(x + 1, x + 3);
		
		//criando o rastro
		var rastro = instance_create_layer(x,y,layer,obj_player_vest);
		rastro.xscale = xscale;
		rastro.yscale = yscale;
	}
}
clamp(dura_efeito_pulo,-1, 10);

//voltando para a escala original
xscale = lerp (xscale, 1, .15);
yscale = lerp (yscale, 1, .15);




