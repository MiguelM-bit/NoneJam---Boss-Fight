/// @description

qtd = instance_number(obj_item);

if (qtd <= 0)
{
	image_alpha += .1;
}

clamp(image_alpha,0,1);
