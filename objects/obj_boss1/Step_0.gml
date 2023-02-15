/// @description

//fazendo ele olhar para o player
image_angle = point_direction(x,y,obj_player.x, obj_player.y);



if ((vida <= 0) && (fase == 0)) //fim da fase 1
{
	// Gerando os pedaços
	for (var i = 0; i < irandom_range(75, 90); i++)
	{
		var part = instance_create_depth(x,y,depth - 1000, obj_part);
		part.sprite_index = sprite_index;
		part._blend = choose(c_grey, c_black);
		part._angle = random(360);
		part._dir = random(360);
		part._speed = random_range(6, 9);
		part._xscale = random_range(.4, .14);
		part._yscale = part._xscale;
	}
	
	fase = 1;
	
	//vida do boss na fase 2
	vida = vida_fase2;
	
	
	//criando as vidas bonus
	instance_create_depth(2304, 512, depth - 1000, obj_vida_extra); //vida em cima na direita
	instance_create_depth(736, 1664, depth - 1000, obj_vida_extra); //em baixo esquerda
	instance_create_depth(1952, 1664, depth - 1000, obj_vida_extra); //em baixo direita
	
	var lay_id = layer_get_id("Backgrounds_1");
	var back_id = layer_background_get_id(lay_id);
	if layer_background_get_sprite(back_id) != spr_background2
	{
	    layer_background_sprite(back_id, spr_background2);
	}
	
}
if ((vida <= 0) && (fase == 1)) //fim da fase 2
{
		// Gerando os pedaços
		for (var i = 0; i < irandom_range(100, 120); i++)
		{
			var part = instance_create_depth(x,y,depth - 1000, obj_part);
			part.sprite_index = sprite_index;
			part._blend = choose(c_grey, c_black);
			part._angle = random(360);
			part._dir = random(360);
			part._speed = random_range(6, 9);
			part._xscale = random_range(.9, 1.2);
			part._yscale = part._xscale;
		}
		// Gerando os pedaços
		for (var i = 0; i < irandom_range(100, 120); i++)
		{
			var part = instance_create_depth(x,y,depth - 1000, obj_part);
			part.sprite_index = sprite_index;
			part._blend = choose(c_grey, c_black);
			part._angle = random(360);
			part._dir = random(360);
			part._speed = random_range(10, 12);
			part._xscale = random_range(1, 1.5);
			part._yscale = part._xscale;
		}
		
		instance_destroy(obj_ataque1);
		instance_destroy(obj_ataque2);
		instance_destroy(obj_inimigo2);
		instance_destroy(obj_boss_olho);
		instance_destroy(obj_boss_asa);

		instance_create_layer(0,0,"Final",obj_final);
		
		for (var b = 0; b < irandom_range(3,5); b++)
		{
			audio_play_sound(snd_boss_morte,1,false);
		}
		
		instance_destroy();
		
}



if (fase == 0) // primeira forma do boss
{
	
	
	//state machine com os ataques
	switch(estado)
	{
		#region //parado e invoca um bixo
		case boss_state.parado:
		
			//definindo o timer
			if (!definiu)
			{
				//tempo para sair do estado
				timer = room_speed * random_range(3, 5);
				definiu = true;
			
				//criando inimigos
				var xx = choose(255, 2428);
				var yy = irandom_range(550, 1585);
				var _ini = instance_create_layer(xx, yy,layer, obj_inimigo2);
				_ini.estado = "avanca";
				_ini.vel = random_range(3, 7);
				_ini.limite = 2170;
				_ini.rot = 0;
				_ini.image_xscale = 2;
				_ini.image_yscale = 2;
				if (xx > 300)
				{
					_ini.dir = 180;
				}else
				{
					_ini.dir = 0;
				}
			}
		
		
			timer--;
			//saindo do estado
			if (timer <= 0)
			{
				var _estado = irandom(qtd_estados)
				if (_estado == 0)
				{
					estado = boss_state.ataque1;
				}else if (_estado == 1)
				{
					estado = boss_state.parado;
				}else if (_estado == 2)
				{
					estado = boss_state.ataque2;
				}else if (_estado == 3)
				{
					estado = boss_state.ataque3;
				}
				
				
					
				definiu = false;
			}
			break;
		#endregion
		
		#region //ataque1 atirando varios bixos em arco
		case boss_state.ataque1:
	
			if (!atacou)
			{
				for (var a = 0; a < 3; a++)
				{
					//tiro multiplo
					for (var i = 0; i < 3; i++)
					{
						var _dir = -45 + (i * 45) + (15 * a);
						var _ataque1 = instance_create_layer(x,y,"Inimigos",obj_ataque1);
						_ataque1.direction = image_angle + _dir + (irandom_range(-a,a));
						_ataque1.speed = 10;
				
					}
				}
				atacou = true;
			}
		
			#region saindo do estado
			//definindo o timer
			if (!definiu)
			{
				//tempo para sair do estado
				timer = room_speed * random_range(3,4.5);
				definiu = true;
			}
		
		
			timer--;
			//saindo do estado
			if (timer <= 0)
			{
				var _estado = irandom(qtd_estados)
				if (_estado == 0)
				{
					estado = boss_state.ataque1;
				}else if (_estado == 1)
				{
					estado = boss_state.parado;
				}else if (_estado == 2)
				{
					estado = boss_state.ataque2;
				}else if (_estado == 3)
				{
					estado = boss_state.ataque3;
				}
			
				definiu = false;
				atacou = false;
			}
		#endregion
	
			break;
		#endregion
	
		#region //ataque2 soltando os bixos por cima
		case boss_state.ataque2:
		
		
			if (!atacou)
			{
				//criando varios
				for (var i = 0; i < 10; i++)
				{
					var xx = 256 + (256 * i);
					var yy = 0;
					var _ataque2 = instance_create_layer(xx + (irandom_range(-128,128)),yy,"Inimigos",obj_ataque1);
					_ataque2.speed = irandom_range(6, 8);
					_ataque2.direction = 270;
				
				}
				atacou = true;
			}
			
			#region saido do estado
		
			//saindo do estado
			//definindo o timer
			if (!definiu)
			{
				//tempo para sair do estado
				timer = room_speed * random_range(3,4.7);
				definiu = true;
			}
		
		
			timer--;
			//saindo do estado
			if (timer <= 0)
			{
				var _estado = irandom(qtd_estados)
				if (_estado == 0)
				{
					estado = boss_state.ataque1;
				}else if (_estado == 1)
				{
					estado = boss_state.parado;
				}else if (_estado == 2)
				{
					estado = boss_state.ataque2;
				}else if (_estado == 3)
				{
					estado = boss_state.ataque3;
				}
			
			
				definiu = false;
				atacou = false;
			}
			#endregion
	
			break;
		
		#endregion
	
		#region //ataque3 soltando os bixos pelos lados
		case boss_state.ataque3:
		
		
			if (!atacou)
			{
				//
				for (var i = 0; i < 8; i++)
				{
					
					//criando inimigos
					var xx = choose(50, 2428);
					var yy = 384 + (256 * i);
					var _ataque2 = instance_create_layer(xx ,yy + (random_range(-50,50)),"Inimigos",obj_ataque1);
					_ataque2.speed = irandom_range(4, 6);
					if (xx > 80) //apareci na direita
					{
						_ataque2.direction = 180;
					}else		//apareci na esquerda
					{
						_ataque2.direction = 0;
					}
				}
				atacou = true;
			}
		
		
			#region saindo do estado
			//definindo o timer
			if (!definiu)
			{
				//tempo para sair do estado
				timer = room_speed * random_range(2.7,4);
				definiu = true;
			}
		
		
			timer--;
			//saindo do estado
			if (timer <= 0)
			{
				var _estado = irandom(qtd_estados)
				if (_estado == 0)
				{
					estado = boss_state.ataque1;
				}else if (_estado == 1)
				{
					estado = boss_state.parado;
				}else if (_estado == 2)
				{
					estado = boss_state.ataque2;
				}
				else if (_estado == 3)
				{
					estado = boss_state.ataque3;
				}
			
				definiu = false;
				atacou = false;
			}
			#endregion
	
			break;
		
		#endregion
		
		
	}
}

else if (fase == 1) // segunda forma do boss
{
	
	//state machine com os ataques
	switch(estado)
	{
		#region //parado e invoca 2 bixo
		case boss_state.parado:
		
			//definindo o timer
			if (!definiu)
			{
				//tempo para sair do estado
				timer = room_speed * random_range(2.5, 3);
				definiu = true;
				
				//criando inimigos
				for (i = 0; i < 2; i++)
				{
					var xx = choose(255, 2428);
					var yy = irandom_range(550, 1585);
					var _ini = instance_create_layer(xx, yy,layer, obj_inimigo2);
					_ini.estado = "avanca";
					_ini.vel = random_range(5, 8);
					_ini.limite = 2170;
					_ini.rot = 0;
					_ini.image_xscale = 2.3;
					_ini.image_yscale = 2.3;
					if (xx > 300)
					{
						_ini.dir = 180;
					}else
					{
						_ini.dir = 0;
					}
				}
				
				//fazendo ele se mover de um lado para o outro
				//
				//escolhendo uma posição aleatoria e movendo o x para la
				//
				
			}
		

			#region //saindo do estado
			timer--;
			if (timer <= 0)
			{
				var _estado = irandom(qtd_estados_fase2)
				if (_estado == 0)
				{
					estado = boss_state.ataque1;
				}else if (_estado == 1)
				{
					estado = boss_state.parado;
				}else if (_estado == 2)
				{
					estado = boss_state.ataque2;
				}else if (_estado == 3)
				{
					estado = boss_state.ataque3;
				}else if (_estado == 4)
				{
					estado = boss_state.ataque4;
				}
				
				definiu = false;
			}
			#endregion
			
			break;
		#endregion
		
		#region //ataque1 ataque tentaculos
		case boss_state.ataque1:
	
			if (!atacou)
			{
				//tentaculos
				//tiro multiplo

				for (var i = 0; i < 6; i++)
				{
					var _dir = -45 + (i * 15);
					var _ataque1 = instance_create_layer(x,y,"Inimigos",obj_ataque2);
					_ataque1.image_angle = image_angle + _dir;
						
				}

				atacou = true;
			}
		
			#region saindo do estado
			//definindo o timer
			if (!definiu)
			{
				//tempo para sair do estado
				timer = room_speed * random_range(3, 4);
				definiu = true;
			}

			timer--;
			
			if (timer <= 0)
			{
				var _estado = irandom(qtd_estados_fase2)
				if (_estado == 0)
				{
					estado = boss_state.ataque1;
				}else if (_estado == 1)
				{
					estado = boss_state.parado;
				}else if (_estado == 2)
				{
					estado = boss_state.ataque2;
				}else if (_estado == 3)
				{
					estado = boss_state.ataque3;
				}else if (_estado == 4)
				{
					estado = boss_state.ataque4;
				}
			
				definiu = false;
				atacou = false;
			}
			#endregion
	
			break;
		#endregion
	
		#region //ataque2 soltando os bixos por cima mais rapido
		case boss_state.ataque2:
		
		
			if (!atacou)
			{
				//criando varios
				for (var i = 0; i < 10; i++)
				{
					var xx = 256 + (256 * i);
					var yy = 0;
					var _ataque2 = instance_create_layer(xx + (irandom_range(-128,128)),yy,"Inimigos",obj_ataque1);
					_ataque2.speed = irandom_range(8, 10);
					_ataque2.direction = 270;
				
				}
				atacou = true;
			}
			
			#region saindo do estado
		
			//saindo do estado
			//definindo o timer
			if (!definiu)
			{
				//tempo para sair do estado
				timer = room_speed * random_range(2.1,2.8);
				definiu = true;
			}
		
		
			timer--;
			//saindo do estado
			if (timer <= 0)
			{
				var _estado = irandom(qtd_estados_fase2)
				if (_estado == 0)
				{
					estado = boss_state.ataque1;
				}else if (_estado == 1)
				{
					estado = boss_state.parado;
				}else if (_estado == 2)
				{
					estado = boss_state.ataque2;
				}else if (_estado == 3)
				{
					estado = boss_state.ataque3;
				}else if (_estado == 4)
				{
					estado = boss_state.ataque4;
				}
			
			
				definiu = false;
				atacou = false;
			}
			#endregion
	
			break;
		
		#endregion
	
		#region //ataque3 atirando os bixos em arco
		case boss_state.ataque3:
		
		
			if (!atacou)
			{
				
				//atirando bixos em arco
				for (var a = 0; a < 3; a++)
				{
					//tiro multiplo
					for (var i = 0; i < 3; i++)
					{
						var _dir = -45 + (i * 45) + (15 * a);
						var _ataque1 = instance_create_layer(x,y,"Inimigos",obj_ataque1);
						_ataque1.direction = image_angle + _dir + (irandom_range(-a,a));
						_ataque1.speed = 10;
				
					}
				}
				
				
				
				atacou = true;
			}
		
		
			#region saindo do estado
			//definindo o timer
			if (!definiu)
			{
				//tempo para sair do estado
				timer = room_speed * random_range(1.9,2.5);
				definiu = true;
			}
		
		
			timer--;
			//saindo do estado
			if (timer <= 0)
			{
				var _estado = irandom(qtd_estados_fase2)
				if (_estado == 0)
				{
					estado = boss_state.ataque1;
				}else if (_estado == 1)
				{
					estado = boss_state.parado;
				}else if (_estado == 2)
				{
					estado = boss_state.ataque2;
				}
				else if (_estado == 3)
				{
					estado = boss_state.ataque3;
				}else if (_estado == 4)
				{
					estado = boss_state.ataque4;
				}
			
				definiu = false;
				atacou = false;
			}
			#endregion
	
			break;
		
		#endregion
		
		#region //ataque4 soltando os bixos pelos lados
		case boss_state.ataque4:
		
		
			if (!atacou)
			{
				//
				for (var i = 0; i < 8; i++)
				{
					
					//criando inimigos
					var xx = choose(50, 2428);
					var yy = 384 + (256 * i);
					var _ataque2 = instance_create_layer(xx ,yy + (random_range(-50,50)),"Inimigos",obj_ataque1);
					_ataque2.speed = irandom_range(5, 6);
					if (xx > 80) //apareci na direita
					{
						_ataque2.direction = 180;
					}else		//apareci na esquerda
					{
						_ataque2.direction = 0;
					}
				}
				atacou = true;
			}
		
		
			#region saindo do estado
			//definindo o timer
			if (!definiu)
			{
				//tempo para sair do estado
				timer = room_speed * random_range(2,2.7);
				definiu = true;
			}
		
		
			timer--;
			//saindo do estado
			if (timer <= 0)
			{
				var _estado = irandom(qtd_estados_fase2)
				if (_estado == 0)
				{
					estado = boss_state.ataque1;
				}else if (_estado == 1)
				{
					estado = boss_state.parado;
				}else if (_estado == 2)
				{
					estado = boss_state.ataque2;
				}
				else if (_estado == 3)
				{
					estado = boss_state.ataque3;
				}
				else if (_estado == 4)
				{
					estado = boss_state.ataque4;
				}
			
				definiu = false;
				atacou = false;
			}
			#endregion
	
			break;
		
		#endregion
		
		
	}
}
