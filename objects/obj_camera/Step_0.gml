/// @description

if (instance_exists(obj_player))
{
	x = lerp(x, obj_player.x, .2);
	y = lerp(y, obj_player.y, .2);
}
