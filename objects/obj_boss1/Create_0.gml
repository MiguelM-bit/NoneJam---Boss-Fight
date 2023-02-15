/// @description

definiu = false;
timer = 0;
atacou = false;


vida = irandom_range(40, 48);
//vida = 2;
vida_fase2 = irandom_range(48, 52);
//vida_fase2 = 12;

fase = 0;


qtd_estados = 3; //quantidade de estado fase 1 contando do 0
qtd_estados_fase2 = 4; //quantidade de estado fase 2 contando do 0
//state machine do boss
enum boss_state
{
	parado, ataque1, ataque2, ataque3, ataque4
}

estado = boss_state.parado;
