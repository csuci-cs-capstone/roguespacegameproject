/// @description Pathfinding Code
// You can write your code in this editor

if instance_exists(obj_player)
{
	myPath = path_add();
	mp_grid_path(obj_grid.grid, myPath, phy_position_x, phy_position_y, obj_player.phy_position_x, obj_player.phy_position_y, true);
	
	var targetX = path_get_point_x(myPath, 1);
	var targetY = path_get_point_y(myPath, 1);
	
	var theta = point_direction(phy_position_x, phy_position_y, targetX, targetY);
	
	var playerTheta = point_direction(phy_position_x, phy_position_y, obj_player.phy_position_x, obj_player.phy_position_y);
	
	phy_rotation += sin(degtorad(-phy_rotation - playerTheta)) * rotationSpeed;
	
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