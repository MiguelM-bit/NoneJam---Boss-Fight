/// @description


if (texto1) //se o texto 1 estiver ativo
{
	//desenha a imagem com o frame 0
	draw_sprite_ext(spr_final, 0, 0, 0, 1, 1, image_angle, image_blend, texto1_alpha);
}
if (texto2)
{
	//desenha a imagem com o frama 1
	draw_sprite_ext(spr_final, 1, 0, 0, 1, 1, image_angle, image_blend, texto2_alpha);
}
if (texto3)
{
	draw_sprite_ext(spr_final, 3, 0, 0, 1, 1, image_angle, cor, texto3_alpha);
	
}
