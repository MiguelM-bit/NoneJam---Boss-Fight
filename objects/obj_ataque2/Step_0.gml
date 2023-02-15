/// @description

if (vida <= 0)
{
	// Gerando os pedaços
	for (var i = 0; i < irandom_range(37, 50); i++)
	{
		var part = instance_create_depth(x,y,depth - 1000, obj_part);
		part.sprite_index = sprite_index;
		part._blend = choose(c_grey, c_black);
		part._angle = random(360);
		part._dir = random(360);
		part._speed = random_range(1, 5);
		part._xscale = random_range(.2, .7);
		part._yscale = part._xscale;
	}
	
	instance_destroy();
}


if (image_xscale >= esticar_max)
{
	image_alpha -= .15;
	
	if (image_alpha <= 0)
	{
		instance_destroy();
	}
}else
{
	image_xscale += esticar;
}


if (image_xscale >= esticar_y_max)
{

}else
{
	image_yscale += esticar_y;
}






