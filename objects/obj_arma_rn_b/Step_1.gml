/// @description

//fazendo a arma seguir o player
x = obj_player.x;
y = obj_player.y - 114;

//fazendo a arma virar na direção do mouse
image_angle = point_direction(x,y,mouse_x, mouse_y);

//timer do tiro
firingdelay -= 1;

//tiro unico
if (mouse_check_button(mb_left)) && (firingdelay < 0)
{
	firingdelay = 37;
	with (instance_create_layer(x,y,"Tiro",obj_tiro))
	{
		speed = 14;
		direction = other.image_angle;
		image_angle = direction;
		//image_blend = choose(c_red, c_purple, c_yellow, c_blue, c_green, c_orange);
		image_blend = choose(c_black);
		ricochete = 2;
		sprite_index = spr_tiro;
	}
	
	//criando a poeira
	for (var i = 0; i < random_range(6, 15); i++)
	{
		var xx = x;
		
		instance_create_depth(xx, y, depth - 1000, obj_vel);
	}
	
	//som do tiro
	audio_play_sound(snd_atirando,1,false);
}
