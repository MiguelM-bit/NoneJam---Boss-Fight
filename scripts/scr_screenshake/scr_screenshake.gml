// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_screenshake(){

}

function screenshake(_treme) {
	var shake = instance_create_layer(0,0,layer,obj_screenshake);
	shake.shake = _treme;
}


