/// @description Insert description here
// You can write your code in this editor

image_angle += 2.5

if canShoot
{
	canShoot = false;
	audio_stop_sound(snd_enemyFire)
	audio_play_sound(snd_enemyFire, 0, false);
	var i, projectileDirection;
		
	for (i = 0; i < 10; i++)
	{
		projectileDirection = image_angle + ((9 * i) - 45);
		
		var projectile = instance_create_layer(x, y, "Interactible", obj_basic);
		
		projectile.phy_speed_x = lengthdir_x(8, projectileDirection);
		projectile.phy_speed_y = lengthdir_y(8, projectileDirection);
	}
		
	alarm_set(0, room_speed/4);	
}