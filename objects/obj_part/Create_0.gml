/// @description

_angle = random(360);
_dir = random(360);
_speed = random_range(1, 5);
_xscale = random_range(.2, .7);
_yscale =  _xscale;
image_speed = 0;
image_index = irandom(image_number - 1);
_blend = make_color_rgb(irandom_range(115,135), irandom_range(115,135), irandom_range(135,180));



image_angle = _angle;
direction = _dir;
speed = _speed;
image_xscale = _xscale;
image_yscale = _yscale;
image_blend = _blend;
            

/* codigo para gerar as particulas

// Gerando os pedaços
for (var i = 0; i < irandom_range(20, 50); i++)
{                                       
    var ped = instance_create_depth(x, y, depth - 1000, obj_part);
    ped.sprite_index = sprite_index;
}

*/
