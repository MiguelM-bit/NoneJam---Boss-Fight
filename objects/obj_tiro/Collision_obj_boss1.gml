/// @description

//diminuindo a vida do inimigo
other.vida--;

//tremendo a camera
screenshake(irandom_range(4,5));


// Gerando os pedaços
for (var i = 0; i < irandom_range(30, 45); i++)
{
	var part = instance_create_depth(x,y,depth - 1000, obj_part);
	part.sprite_index = sprite_index;
	part._blend = choose(c_grey, c_black);
	part._angle = random(360);
	part._dir = random(360);
	part._speed = random_range(1, 5);
	part._xscale = random_range(.5, .7);
	part._yscale = part._xscale;
}

//som do hit
audio_play_sound(snd_hit_no_boss,1,false);

//destruindo o tiro
instance_destroy();
