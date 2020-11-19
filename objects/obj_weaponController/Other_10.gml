/// @description Insert description here
// You can write your code in this editor

if weaponIndex == 3
{
	if obj_target.currentTargetedInstance != noone && !jointCreated
	{
		connectedInstance = obj_target.currentTargetedInstance;
		connection = physics_joint_weld_create(connectedInstance, obj_player, obj_player.phy_position_x, obj_player.phy_position_y, degtorad(degtorad(-obj_player.phy_rotation)) - degtorad(degtorad(-connectedInstance.phy_rotation)), 8, 10, true)
		jointCreated = true;
	}
}