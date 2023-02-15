/// @description


// Gerando os pedaços
for (var i = 0; i < irandom_range(65, 95); i++)
{
	var part = instance_create_depth(x,y,depth - 1000, obj_part);
	part.sprite_index = sprite_index;
	part._blend = make_color_rgb(irandom_range(115,135), irandom_range(115,135), irandom_range(135,180));
	part._angle = random(360);
	part._dir = random(360);
	part._speed = random_range(4, 7);
	part._xscale = random_range(1, 1.4);
	part._yscale = part._xscale;
}
