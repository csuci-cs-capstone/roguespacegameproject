// @function				physics_pathfind(_force, _x, _y);
// @param {index} path		Path variable used for pathfinding
// @param {index} grid		Grid to use for pathfinding
// @param {real} force		Amount of force desired to move to the next waypoint
// @param {real} xStart		X coordinate of start
// @param {real} yStart		Y coordinate of start
// @param {real} xGoal		X coordinate of destination
// @param {real} yGoal		Y coordinate of destination

function physics_pathfind_towards(path, grid, force, xGoal, yGoal)
{
	var coords = find_closest_valid_coordinates(grid, xGoal, yGoal, 3);
	
	mp_grid_path(grid, path,phy_position_x, phy_position_y, coords[0], coords[1], true);	// Fill the path based on the grid
	
	var theta = point_direction(phy_position_x, phy_position_y, path_get_point_x(path, 1), path_get_point_y(path, 1));	// Direction towards next path waypoint
	
	physics_apply_force(phy_position_x, phy_position_y, lengthdir_x(force, theta), lengthdir_y(force, theta));
}

// @function			find_closest_valid_coordinates(grid, x, y, r)
// @param {index} grid	grid for checking obstacles
// @param {real} x		x coordinate to check
// @param {real} y		y coordinate to check
// @param {real} r		radius to check
function find_closest_valid_coordinates(grid, x, y, r)
{
	var gridX = x div global.gridSize;
	var gridY = y div global.gridSize;
	
	var validX, validY, i;
	
	if mp_grid_get_cell(grid, gridX, gridY) == -1
	{
		var tempGrid = ds_grid_create(global.gridSize, global.gridSize);
		mp_grid_to_ds_grid(grid, tempGrid);
		for (i = 1; i <= r; i++)
		{
		
			validX = ds_grid_value_disk_x(tempGrid, gridX, gridY, i, 0) * global.gridSize;
			validY = ds_grid_value_disk_y(tempGrid, gridX, gridY, i, 0) * global.gridSize;
			
			if validX >= 0 && validY >= 0
			{
				ds_grid_destroy(tempGrid);
				return [validX, validY]
			}
		}
		
		return [-1, -1]
	}
	else
	{
		return [x, y]	
	}
}

// @function			find_closest_valid_coordinates(grid, x, y, rCheck)
// @param {index} grid	grid for checking obstacles
// @param {real} r		radius to check around generated coordinates if generated coordinates is invalid
function generate_random_valid_coordinates(grid, rCheck)
{
	var validXY = [-1, -1];
	
	while validXY[0] == -1 && validXY[1] == -1
	{
		validXY = find_closest_valid_coordinates(grid, random_range(0, room_width), random_range(0, room_height), rCheck);
	}
	
	return validXY;
}

// @function			generate_random_valid_coordinates_in_radius(grid, x, y, r, rCheck)
// @param {index} grid	grid for checking obstacles
// @param {real} x		x coordinates of the center for	generated coordinates
// @param {real} y		y coordinates of the center for generated coordinates
// @param {real} r		radius surrounding the center where the generated coordinates will be in
// @param {real} rCheck	radius to check around generated coordinates if generated coordinates is invalid
function generate_random_valid_coordinates_in_radius(grid, x, y, r, rCheck)
{
	var validXY = [-1, -1];
	
	while validXY[0] == -1 && validXY[1] == -1
	{
		validXY = find_closest_valid_coordinates(grid, clamp(random_range(x - r, x + r), 0, room_width), clamp(random_range(y - r, y + r), 0, room_height), rCheck);
	}
	
	return validXY;
}

// @function				generate_random_valid_coordinates_in_specific_radius(grid, x, y, r, rCheck)
// @param {index} grid		grid for checking obstacles
// @param {real} x			x coordinates of the center for	generated coordinates
// @param {real} y			y coordinates of the center for generated coordinates
// @param {real} distance	distance from the center where the generated coordinates will be in
// @param {real} rCheck		radius to check around generated coordinates if generated coordinates is invalid
function generate_random_valid_coordinates_in_specific_radius(grid, x, y, distance, rCheck)
{
	var validXY = [-1, -1];
	var randDirection;
	
	while validXY[0] == -1 && validXY[1] == -1
	{
		randDirection = random_range(0, 360);
		validXY = find_closest_valid_coordinates(grid, clamp(lengthdir_x(distance, randDirection), 0, room_width), clamp(lengthdir_y(distance, randDirection), 0, room_height), rCheck);
	}
	
	return validXY;
}

// @function			generate_opposite_direction(grid, x, y, x2, y2)
// @param {index} grid	Grid to check if a direction is going into an invalid cell
// @param {real} x		x coordinates for direction to point from
// @param {real} y		y coordinates for direction to point from
// @param {real} x2		x coordinates for direction to point away from
// @param {real} y2		y coordinates for direction to point away from
function generate_opposite_direction_avoid_obstacles(grid, x, y, theta)
{
	var i, angle, neighborX, neighborY;
	
	var xDiv = x div global.gridSize;
	var yDiv = y div global.gridSize;
	
	theta += 180;
	
	var xVector = lengthdir_x(1, theta);
	var yVector = lengthdir_y(1, theta);
	
	for (i = 0; i < 8; i++)
	{
		angle = 45 * i;
		neighborX = floor(lengthdir_x(1, angle) + 0.5) + xDiv;
		neighborY = floor(lengthdir_y(1, angle) + 0.5) + yDiv;
		
		if mp_grid_get_cell(grid, neighborX, neighborY) == -1
		{
			theta = point_direction(xDiv, yDiv, neighborX, neighborY) + 180;
			xVector += lengthdir_x(1, theta);
			yVector += lengthdir_y(1, theta);
		}
	}
	
	if xVector == 0 && yVector == 0
	{
		theta += 90;	
	}
	
	theta = point_direction(0, 0, xVector, yVector);
	
	return theta;
}

// @function			generate_towards_direction(grid, x, y, x2, y2)
// @param {index} grid	Grid to check if a direction is going into an invalid cell
// @param {real} x		x coordinates for direction to point from
// @param {real} y		y coordinates for direction to point from
// @param {real} x2		x coordinates for direction to point towards
// @param {real} y2		y coordinates for direction to point towards
function generate_towards_direction_avoid_obstacles(grid, x, y, theta)
{
	var i, angle, neighborX, neighborY;
	
	var xDiv = x div global.gridSize;
	var yDiv = y div global.gridSize;
	
	var xVector = lengthdir_x(1, theta);
	var yVector = lengthdir_y(1, theta);
	
	for (i = 0; i < 8; i++)
	{
		angle = 45 * i;
		neighborX = floor(lengthdir_x(1, angle) + 0.5) + xDiv;
		neighborY = floor(lengthdir_y(1, angle) + 0.5) + yDiv;
		
		if mp_grid_get_cell(grid, neighborX, neighborY) == -1
		{
			theta = point_direction(xDiv, yDiv, neighborX, neighborY) + 180;
			xVector += lengthdir_x(1, theta);
			yVector += lengthdir_y(1, theta);
		}
	}
	
	if xVector == 0 && yVector == 0
	{
		theta +=  90;	
	}
	
	theta = point_direction(0, 0, xVector, yVector);
	
	return theta;
}

function can_see_player()
{
	return collision_line(phy_position_x, phy_position_y, obj_player.phy_position_x, obj_player.phy_position_y, obj_obstacleParent, false, true) == noone	
}