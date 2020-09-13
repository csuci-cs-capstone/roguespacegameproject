/// @description Pathfinding Code
// You can write your code in this editor

if instance_exists(obj_player)
{
	if distance_to_object(obj_player) >= 100
	{
		phy_linear_damping = 2;
		physics_pathfind(myPath, obj_grid.grid, enginePower, obj_player.phy_position_x, obj_player.phy_position_y);
	}
	else
	{
		phy_linear_damping = 5;	
	}
}