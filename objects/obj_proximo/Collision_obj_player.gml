/// @description


if (qtd <= 0)
{
	//indo para proxima room se ela existir
	if (room_next(room) != -1)
	{
		
		var target = room_next(room);
		
		if (room == rn_e) //se for a sala do boss
		{
			//TransitionStart(target,sq_fadeOut, sq_fadeIn);
			TransitionStart(target,sq_2_boss, sq_3_boss);
		}else
		{
			TransitionStart(target,sq_2, sq_3);
		}
	}
	else
	{
		//se n tiver mais room, reinicia o jogo
		game_restart();
	}
}
