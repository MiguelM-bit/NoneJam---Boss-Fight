/// @description

//x = lerp(x, obj_player.x, .15);
//y = lerp(y, obj_player.y, .15);



image_xscale -= 1;
image_yscale -= .5;

image_alpha -= .08;

if (image_alpha <= 0) instance_destroy();
