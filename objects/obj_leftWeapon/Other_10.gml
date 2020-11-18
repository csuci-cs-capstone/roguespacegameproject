/// @description Fire Projectile
// You can write your code in this editor

var proj = instance_create_layer(x, y, "Interactible", obj_player.currentWeapon.projectile)
var accuracy = get_stat("accuracyStat")
proj.aimTowards = image_angle + random_range(-accuracy, accuracy);
with(proj)
{
	event_user(0);	
}
image_index = 1;
image_speed = 1;