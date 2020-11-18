/// @description Insert description here
// You can write your code in this editor

var closestEnemy = instance_nearest(phy_position_x, phy_position_y, obj_defaultEnemyParams);

if closestEnemy != noone
{
	var playerTheta = point_direction(phy_position_x, phy_position_y, closestEnemy.phy_position_x, closestEnemy.phy_position_y);
	phy_rotation += clamp(sin(degtorad(-phy_rotation - playerTheta)) * rotationSpeed, -2, 2);
	
	if distance_to_object(closestEnemy) < 10
	{
		instance_destroy()	
	}
}
physics_apply_force(phy_position_x, phy_position_y, lengthdir_x(enginePower, -phy_rotation), lengthdir_y(enginePower, -phy_rotation));