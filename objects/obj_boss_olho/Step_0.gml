/// @description 

//reduzindo o tempo para mudar a sprite
timer--;

//se ele zerar
if (timer <= 0)
{
	//gera um numero aleatorio até 100
	chance = random(100);
	//se o numero for mais que 90, 10% de chance
    if (chance > 90)
	{
		if (obj_boss1.fase == 0)
		{
			//escolhe entre as duas sprites
			sprite_index = choose(spr_olho, spr_olho_meio);
			timer = irandom_range(80, 100);
		}else if (obj_boss1.fase == 1)
		{
			//escolhe entre as duas sprites
			sprite_index = choose(spr_olho2, spr_olho_meio2);
			timer = irandom_range(80, 100);
		}
	}
}

//olhando para o player
if (instance_exists(obj_player))
{
	if (sprite_index == spr_olho) || (sprite_index == spr_olho2)
	{
		if ((obj_boss1.fase == 1) && (obj_boss1.vida < 11)) //estiver na fase 2 e com menos de 10 de vida
		{
			timer_1--;
			if (timer_1 <= 0)
			{
				image_angle = random(360);
				timer_1 = room_speed - 10;
				image_blend = make_color_rgb(245, 85, 93);
			}
		}else
		{
			image_angle = point_direction(x,y,obj_player.x, obj_player.y);
		}
	}
}



/*
x = lerp(x, Object36.x, lerp_vel);
