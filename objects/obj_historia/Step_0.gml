/// @description


if (timer <= 0)
{
	//ativando texto 1
	texto1 = true;
}else
{
	timer--;
}

if (texto1) //se o texto 1 estiver ativo
{
	//transparencia completa
	if (texto1_alpha >= 1)
	{
		texto2 = true;
	}else //transparencia ainda nao esta completa
	{
		texto1_alpha += transparencia;
	}
}

if (texto2)
{
	if (texto2_alpha >= 1)
	{
		texto3 = true;
	}else
	{
		texto2_alpha += transparencia;
	}
	
}

if (texto3)
{
	if (texto3_alpha >= 1)
	{
		
	}else
	{
		texto3_alpha += transparencia;
	}
	
}


