/// @description

//diminuindo a vida do inimigo
other.vida--;

//tremendo a camera
screenshake(shake_force);

//som do hit
audio_play_sound(snd_hit_no_inimigo,1,false);

//destruindo o tiro
instance_destroy();
