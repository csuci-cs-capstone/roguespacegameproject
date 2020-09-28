/// @description Insert description here
// You can write your code in this editor

var distanceToPlayer = distance_to_object(obj_player)

if (distanceToPlayer < 200)
{
	var theta = point_direction(phy_position_x, phy_position_y, obj_player.phy_position_x, obj_player.phy_position_y);
	movementDirection = theta;
	physics_apply_force(phy_position_x, phy_position_y, lengthdir_x(attractiveForce, theta), lengthdir_y(attractiveForce, theta));	
}

if (distanceToPlayer < 5)
{
	instance_destroy();
}

