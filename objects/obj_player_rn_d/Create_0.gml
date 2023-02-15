/// @description

//item upgrade
/*
qtd = instance_number(obj_item);
upgrade = true;
*/


if (!instance_exists(obj_arma))
{
	instance_create_layer(x,y,"Arma", obj_arma);
}




////////////////////////////////////////////////////////

grav = .3;
acel_chao = .25;
acel_ar = .55;
acel = acel_chao;
deslize = 2;

// velocidades
velh = 0;
velv = 0;

// limite das velocidades
max_velh = 9.7; //antes ta 5.9
max_velv = 15.3;

len = 9.2;

//bonus para o pulo
limite_pulo = 6;
timer_pulo = 0;

limite_buffer = 6;
timer_queda = 0;
buffer_pulo = false;
 
limite_parede = 6;
timer_parede = 0;

//variaveis de controle
chao = false;
parede_dir = false;
parede_esq = false;
yscale = 1;
xscale = 1;
dura = room_speed/4;
dir = 0;
carga = 1;
ultima_parede = 0;
ver = 1;

pulo_extra = 1;

//controlando a cor
sat = 85;


//efeito pulo duplo
dura_efeito_pulo = 0;
efeito_pulo = false;


enum state_rn_d
{
	parado, movendo, morte
}

estado = state_rn_d.parado;


//Criando a camera
if(!instance_exists(obj_camera))
{
    //Camera não existe
    instance_create_layer(0,0,layer,obj_camera);
}

