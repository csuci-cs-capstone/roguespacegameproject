/// @description Insert description here
// You can write your code in this editor

if (obj_player.dodging)
{
	visible = 0;
}
else
{
	visible = 1;
	
	fireKey = mouse_check_button(mb_left);
	
	if charged
	{
		if fireKey
		{
			charged = false;
			alarm_set(0, room_speed * 0.25);
			var projectile = instance_create_layer(x, y, "Interactible", obj_simpleProjectile)
			projectile.direction = image_angle;
			projectile.projectileSpeedX = obj_player.xVelocity
			projectile.projectileSpeedY = obj_player.yVelocity
			image_index = 1;
			image_speed = 1;
		}
	}
}