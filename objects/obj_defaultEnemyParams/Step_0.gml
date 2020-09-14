/// @description Pathfinding Code
// You can write your code in this editor

if instance_exists(obj_player)
{
	//if distance_to_object(obj_player) >= 100 || collision_line(phy_position_x, phy_position_y, obj_player.phy_position_x, obj_player.phy_position_y, obj_obstacleParent, false, true) != noone
	//{
	//	phy_linear_damping = 2;
	//	physics_pathfind_towards(myPath, obj_grid.grid, enginePower, obj_player.phy_position_x, obj_player.phy_position_y);
	//}
	//else
	//{
	//	phy_linear_damping = 5;	
	//}
	if distance_to_object(obj_player) < 100
	{
		behavior_avoid();
	}
}