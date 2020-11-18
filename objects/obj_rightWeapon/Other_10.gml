/// @description Fire Projectile
// You can write your code in this editor

var proj = instance_create_layer(x, y, "Interactible", obj_player.currentWeapon.projectile)
proj.aimTowards = image_angle + random_range(-get_stat("accuracyStat"), get_stat("accuracyStat"));
with(proj)
{
	event_user(0);	
}
image_index = 1;
image_speed = 1;