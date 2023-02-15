/// @description


//criando o rastro
var rastro = instance_create_layer(x,y,layer,obj_tiro_vest);
rastro.image_angle = obj_tiro.image_angle;



// horizontal check
if place_meeting(x + lengthdir_x(speed + 1 ,direction), y ,obj_plat)
{
	if (ricochete > 0)
	{
		//direction = direction + irandom_range(70, 118);
		direction = 180 - direction;
		image_angle = direction;
		ricochete--;
	}else
	{
		instance_destroy();
	}
}

// vertical check
if place_meeting(x, y + lengthdir_y(speed + 1, direction), obj_plat)
{
	//direction=-1;
	if (ricochete > 0)
	{
		//direction = direction + irandom_range(70, 118);
		direction = direction + irandom_range(90, 270);
		image_angle = direction;
		ricochete--;
	}else
	{
		instance_destroy();
	}
}
	
	





