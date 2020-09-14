/// @description Insert description here
// You can write your code in this editor

var playerTheta = point_direction(phy_position_x, phy_position_y, obj_player.phy_position_x, obj_player.phy_position_y);
phy_rotation += sin(degtorad(-phy_rotation - playerTheta)) * rotationSpeed;

if canShoot && (collision_line(phy_position_x, phy_position_y, obj_player.phy_position_x, obj_player.phy_position_y, obj_obstacleParent, false, true) == noone)
{
	canShoot = false;
	
	theta = point_direction(phy_position_x, phy_position_y, obj_player.phy_position_x, obj_player.phy_position_y);
	theta += random_range(-5, 5);

	projectile = instance_create_layer(x, y, "Interactible", obj_bigFast);
	projectile.phy_speed_x = lengthdir_x(40, theta);
	projectile.phy_speed_y = lengthdir_y(40, theta);
	
	alarm_set(0, room_speed);	
}