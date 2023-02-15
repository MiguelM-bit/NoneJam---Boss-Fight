/// @description

//checando se eu acabei de cair no chao

var temp = place_meeting(x, y + 1, obj_plat);

if (temp && !chao) // acabei de cair no chao
{
	xscale = 1.6;
	yscale = .5;
	
	//criando a poeira
	for (var i = 0; i < random_range(4, 10); i++)
	{
		var xx = random_range(x - sprite_width/2, x + sprite_width/2);
		
		instance_create_depth(xx, y, depth - 1000, obj_vel);
	}
}


//reiniciar
if(keyboard_check_pressed(vk_enter)) room_restart();


