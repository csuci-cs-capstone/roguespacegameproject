/// @description Pathfinding Code
// You can write your code in this editor

if instance_exists(obj_player)
{
	var forceVector = physics_pathfind(myPath, obj_grid.grid, enginePower, phy_position_x, phy_position_y, obj_player.phy_position_x, obj_player.phy_position_y);
	
	if distance_to_object(obj_player) >= 100
	{
		phy_linear_damping = 2;
		physics_apply_force(phy_position_x, phy_position_y, forceVector[0], forceVector[1]);
	}
	else
	{
		phy_linear_damping = 5;	
	}
}