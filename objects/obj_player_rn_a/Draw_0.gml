/// @description 

//draw_self();


if (velh != 0) ver = sign(velh);

//desenhando o player
draw_sprite_ext(sprite_index, image_index, x ,y + (sprite_height/4 - sprite_height/4 * yscale), xscale * ver, yscale, image_angle, image_blend, image_alpha);
