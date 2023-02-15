/// @description


//matando o inimigo quando a vida chegar a zero
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

switch(estado)
{
	#region avanca
	case "avanca":
	
	girou = false;
	
	// Descobrindo a direção do limite
	var limite_x = lengthdir_x(limite, dir);
	var limite_y = lengthdir_y(limite, dir);
	
	// Movendo
	x += lengthdir_x(vel,dir);
	y += lengthdir_y(vel,dir);
	
	// Trocando de estado x
	if (limite_x > 0)//Tenho que ir para a direita
	{
	    if (x >= xstart + limite_x) estado = "recua";
	}
	else if (limite_x < 0)//Tenho que ir para a esquerda
	{
	    if (x <= xstart + limite_x) estado = "recua";
	}
	
	// Trocando de estado y
	if (limite_y > 0)//Tenho que ir para 
	{
	    if (y >= ystart + limite_y) estado = "recua";
	}
	else if (limite_y < 0)//Tenho que ir para
	{
	    if (y <= ystart + limite_y) estado = "recua";
	}
	
		break;
	#endregion
	
	#region recua
	case "recua":
		
		if (girou == false)
		{
			girou = true;
		}
	
		// Movendo
		x -= lengthdir_x(vel, dir);
		y -= lengthdir_y(vel, dir);
		
		// Mudando de estado
		if (x == xstart && y == ystart) estado = "avanca";
	
		break;
	#endregion
	
	#region parado
	case "parado":
	
		break;
	#endregion
	
	#region default
	default:
	
	    show_message("Você digitouonome do estado errado !!!");
		
	    break;
	#endregion
}
show_debug_message(dir);


if (dir == 180) // indo para esquerda
{
	if (girou == false) sprite_index = spr_inimigo1_esq;
	else sprite_index = spr_inimigo1_dir;
}
else if (dir == 0) //indo para direita
{
	if (girou == false) sprite_index = spr_inimigo1_dir;
	else sprite_index = spr_inimigo1_esq;
}else if (dir == 270) // indo para baixo
{
	if (girou == false) sprite_index = spr_inimigo1_esq;
	else sprite_index = spr_inimigo1_dir;
}
else if (dir == 90) //indo para cima
{
	if (girou == false) sprite_index = spr_inimigo1_dir;
	else sprite_index = spr_inimigo1_esq;
}
