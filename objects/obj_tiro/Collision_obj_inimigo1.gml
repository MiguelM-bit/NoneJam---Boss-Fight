/// @description

//tirando vida do inimigo
other.vida--;


//fazendo a tela tremer
screenshake(shake_force);

//som do hit
audio_play_sound(snd_hit_no_inimigo,1,false);

//destruindo o tiro
instance_destroy();
