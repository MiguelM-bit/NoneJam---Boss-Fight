/// @description

/*
estado = "avanca";
dir = 0;
vel = 0;
limite = 0;
rot = 0;
*/

girou = false;

vida = 2;


// Gerando os pedaços
for (var i = 0; i < irandom_range(100, 130); i++)
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


