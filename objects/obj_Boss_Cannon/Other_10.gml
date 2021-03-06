/// @description Insert description here
// You can write your code in this editor

if instance_exists(obj_player)
{
	image_angle = point_direction(x, y, obj_player.x, obj_player.y)
}

if canShoot
{
	canShoot = false;
	audio_stop_sound(snd_enemyFire)
	audio_play_sound(snd_enemyFire, 0, false);
	var projectileDirection;
		
	projectileDirection = image_angle;
		
	var projectile = instance_create_layer(x, y, "Interactible", obj_fast);
		
	projectile.phy_speed_x = lengthdir_x(25, projectileDirection);
	projectile.phy_speed_y = lengthdir_y(25, projectileDirection);
	projectile.phy_rotation = -image_angle;
	projectile.depth = -10
	projectile.damage = 25;
		
	alarm_set(0, room_speed/2);	
}