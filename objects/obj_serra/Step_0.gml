/// @description

//girando

image_angle += rot;

switch(estado)
{
	#region avanca
	case "avanca":
	
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
show_debug_message(estado);
