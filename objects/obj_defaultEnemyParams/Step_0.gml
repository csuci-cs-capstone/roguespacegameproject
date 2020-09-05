/// @description Pathfinding Code
// You can write your code in this editor

if instance_exists(obj_player)
{
	myPath = path_add();
	
	// if mp_grid_get_cell(obj_grid.grid, obj_player.phy_position_x div obj_grid.gridXSize, obj_player.phy_position_y div obj_grid.gridYSize)
	
	mp_grid_clear_rectangle(obj_grid.grid, obj_player.phy_position_x - 12, obj_player.phy_position_y - 12, obj_player.phy_position_x + 12, obj_player.phy_position_y + 12);
	
	mp_grid_path(obj_grid.grid, myPath, phy_position_x, phy_position_y, obj_player.phy_position_x, obj_player.phy_position_y, true);
	
	var targetX = path_get_point_x(myPath, 1);
	var targetY = path_get_point_y(myPath, 1);
	
	var theta = point_direction(phy_position_x, phy_position_y, targetX, targetY);
	
	var xForce = lengthdir_x(enginePower, theta);
	var yForce = lengthdir_y(enginePower, theta);
	if distance_to_object(obj_player) >= 100
	{
		phy_linear_damping = 2;
		physics_apply_force(phy_position_x, phy_position_y, xForce, yForce);
	}
	else
	{
		phy_linear_damping = 5;	
	}
}