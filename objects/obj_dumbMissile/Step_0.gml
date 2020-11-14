/// @description Insert description here
// You can write your code in this editor

if (currentHealth <= 0 || (instance_exists(obj_player) && !obj_player.dodging && distance_to_object(obj_player) < 10))
{
	instance_destroy()	
}

if instance_exists(obj_player)
{
	var playerTheta = point_direction(phy_position_x, phy_position_y, obj_player.phy_position_x, obj_player.phy_position_y);
	phy_rotation += clamp(sin(degtorad(-phy_rotation - playerTheta)) * rotationSpeed, -2, 2);
}
physics_apply_force(phy_position_x, phy_position_y, lengthdir_x(enginePower, -phy_rotation), lengthdir_y(enginePower, -phy_rotation));