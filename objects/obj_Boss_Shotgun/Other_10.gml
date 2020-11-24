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
	var i, projectileDirection;
		
	for (i = 0; i < 10; i++)
	{
		projectileDirection = image_angle + ((9 * i) - 45) + angleOffset;
		
		var projectile = instance_create_layer(x, y, "Interactible", obj_basic);
		
		projectile.phy_speed_x = lengthdir_x(8, projectileDirection);
		projectile.phy_speed_y = lengthdir_y(8, projectileDirection);
		projectile.depth = -10
		projectile.damage = 15;
	}
		
	alarm_set(0, room_speed/1.5);	
}