/// @description

if (instance_exists(obj_player))
{
	if (obj_player.y > y)// Estou mais alto que o player
	{
		ativo = true;
	}
	else
	{
		ativo = false;
	}          
}


if (ativo)
{
	sprite_index = -1;
}
else
{
	sprite_index = spr_plat_cima;
} 

