/// @description Fire weapon
// You can write your code in this editor

if !obj_player.dodging && mouse_check_button(mb_left) && canFire && !obj_jumpMechanics.jump
{
	var proj = instance_create_layer(x, y, "Interactible", obj_player.equipped[? "basicWeaponSlot"].projectile)
	var accuracy = get_stat("accuracyStat")
	proj.aimTowards = image_angle + irandom_range(-accuracy, accuracy);
	with(proj)
	{
		event_user(0);	
	}
	image_index = 1;
	image_speed = 1;
}