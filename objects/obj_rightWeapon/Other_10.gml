/// @description Insert description here
// You can write your code in this editor

if !obj_player.dodging && mouse_check_button(mb_left) && canFire && !obj_jumpMechanics.jump
{
	//alarm_set(0, room_speed * (1 / get_stat("firerateStat")));
	var proj = instance_create_layer(x, y, "Interactible", obj_player.equipped[? "rightWeaponSlot"].projectile)
	proj.aimTowards = image_angle;
	with(proj)
	{
		event_user(0);	
	}
	image_index = 1;
	image_speed = 1;
}