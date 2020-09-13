// @function				physics_pathfind(_force, _x, _y);
// @param {index} path		Path variable used for pathfinding
// @param {index} grid		Grid to use for pathfinding
// @param {real} force		Amount of force desired to move to the next waypoint
// @param {real} xStart	X coordinate of start
// @param {real} yStart	Y coordinate of start
// @param {real} xGoal		X coordinate of destination
// @param {real} yGoal		Y coordinate of destination

function physics_pathfind(path, grid, force, xGoal, yGoal)
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
	var gridX = x div obj_grid.gridSize;
	var gridY = y div obj_grid.gridSize;
	
	var validX, validY, i;
	
	if mp_grid_get_cell(grid, gridX, gridY) == -1
	{
		var tempGrid = ds_grid_create(obj_grid.gridSize, obj_grid.gridSize);
		mp_grid_to_ds_grid(grid, tempGrid);
		for (i = 1; i <= r; i++)
		{
		
			validX = ds_grid_value_disk_x(tempGrid, gridX, gridY, i, 0) * obj_grid.gridSize;
			validY = ds_grid_value_disk_y(tempGrid, gridX, gridY, i, 0) * obj_grid.gridSize;
			
			if validX != -1 && validY != -1
			{
				ds_grid_destroy(tempGrid);
				return [validX, validY]
			}
		}
		
		return [validX, validY]
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

function generate_random_valid_coordinates_in_radius(grid, x, y, r, rCheck)
{
	var validXY = [-1, -1];
	
	while validXY[0] == -1 && validXY[1] == -1
	{
		validXY = find_closest_valid_coordinates(grid, clamp(random_range(x - r, x + r), 0, room_width), clamp(random_range(y - r, y + r), 0, room_height), r);
	}
	
	return validXY;
}

// @function				pathfind(grid, xStart, yStart, xGoal, yGoal)
// @param {index} grid		grid to obtain node weights
// @param {index} path		path to save path to
// @param {real} xStart		start x coordinate
// @param {real} yStart		start y coordinate
// @param {real} xGoal		goal x coordinate
// @param {real} yGoal		goal y coordinate
function pathfind(grid, path, xStart, yStart, xGoal, yGoal)
{
	if xStart <= 0 || xStart >= room_width
		|| yStart <= 0 || yStart >= room_height
		|| xGoal <= 0 || xGoal >= room_width
		|| yGoal <= 0 || yGoal >= room_height
	{
		return false;	
	}
	
	var gridWidth = ds_grid_width(grid);
	var gridHeight = ds_grid_height(grid);
	
	path_clear_points(path);
	path_set_closed(path, false);
	
	var xStartShrunk = floor((xStart / gridWidth)) + 0.5;
	var yStartShrunk = floor((yStart / gridHeight)) + 0.5;
	var xGoalShrunk = floor((xGoal / gridWidth)) + 0.5;
	var yGoalShrunk = floor((yGoal / gridHeight)) + 0.5;
	
	open = ds_priority_create();
	closed = ds_list_create();
	
	ds_priority_add(open, [xStartShrunk, yStartShrunk, noone], 0);
	
	var q, angle, successor_x, successor_y, cost, i;
	
	while !ds_priority_empty(open)
	{
		q = ds_priority_delete_min(open);
		ds_list_add(closed, [q[0], q[1]]);
		
		for (i = 0; i < 8; i++)
		{
			angle = 45 * i;
			successor_x = floor(lengthdir_x(1, angle) + 0.5) + q[0];
			successor_y = floor(lengthdir_y(1, angle) + 0.5) + q[1];
			
			if q[0] == xGoalShrunk && q[1] == yGoalShrunk
			{
				while q != noone
				{
					path_insert_point(path, 0, q[0] * gridWidth, q[1] * gridHeight, 100);
					q = q[2];
				}
				
				ds_priority_destroy(open);
				ds_list_destroy(closed);
				
				return true;
			}
			
			if successor_x > 0 && successor_x < gridWidth
				&& successor_y > 0 && successor_y < gridHeight
				&& ds_grid_get(grid, successor_x, successor_y) >= 0
				&& ds_list_find_index(closed, [successor_x, successor_y]) == -1
			{
				cost = i % 2 ? 1.4 : 1.0;
				cost += ds_grid_get(grid, successor_x, successor_y);
				ds_priority_add(open, [successor_x, successor_y, q], cost + point_distance(successor_x, successor_y, xGoalShrunk, yGoalShrunk));
			}
			
		}
	}
}

// @function					addInstancesWithWeights(grid, instanceId, weight)
// @param {index} grid			grid to set weights
// @param {index} instanceId	instance to check collision with
// @param {real} weight			weight to set
function addInstancesWithWeights(grid, instanceId, weight)
{
	if (instance_exists(instanceId))
	{
		var gridWidth = ds_grid_width(grid);
		var gridHeight = ds_grid_height(grid);
		
		var i, gridX, gridY;
		for (i = 0; i < instance_number(instanceId); i++)
		{
			gridX = instance_find(instanceId, i).x / gridWidth;
			gridY = instance_find(instanceId, i).y / gridHeight;
			if gridX > 0 && gridX < gridWidth
				&& gridY > 0 && gridY < gridHeight
			{
				ds_grid_set_disk(grid, gridX, gridY, 1, weight);
			}
		}
	}
}