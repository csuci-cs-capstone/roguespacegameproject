// @function				physics_pathfind(_force, _x, _y);
// @param {index} _path		Path variable used for pathfinding
// @param {index} _grid		Grid to use for pathfinding
// @param {real} _force		Amount of force desired to move to the next waypoint
// @param {real} _xStart		X coordinate of start
// @param {real} _yStart		Y coordinate of start
// @param {real} _xGoal		X coordinate of destination
// @param {real} _yGoal		Y coordinate of destination

function physics_pathfind(_path, _grid, _force, _xStart, _yStart, _xGoal, _yGoal)
{
	mp_grid_path(_grid, _path, _xStart, _yStart, _xGoal, _yGoal, true);	// Fill the path based on the grid
	
	var theta = point_direction(_xStart, _yStart, path_get_point_x(_path, 1), path_get_point_y(_path, 1));	// Direction towards next path waypoint
	
	return [lengthdir_x(_force, theta), lengthdir_y(_force, theta)];
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
	if xStart < 0 || xStart > room_width
		|| yStart < 0 || yStart > room_height
		|| xGoal < 0 || xGoal > room_width
		|| yGoal < 0 || yGoal > room_height
	{
		return false;	
	}
	
	path_clear_points(path);
	path_set_closed(path, false);
	
	var xStartShrunk = floor((xStart / obj_grid.gridSize)) + 0.5;
	var yStartShrunk = floor((yStart / obj_grid.gridSize)) + 0.5;
	var xGoalShrunk = floor((xGoal / obj_grid.gridSize)) + 0.5;
	var yGoalShrunk = floor((yGoal / obj_grid.gridSize)) + 0.5;
	
	open = ds_priority_create();
	closed = ds_list_create();
	
	ds_priority_add(open, [xStartShrunk, yStartShrunk, noone], 0);
	
	var q, angle, successor_x, successor_y, cost;
	
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
					path_insert_point(path, 0, q[0] * obj_grid.gridSize, q[1] * obj_grid.gridSize, 100);
					q = q[2];
				}
				
				ds_priority_destroy(open);
				ds_list_destroy(closed);
				
				return true;
			}
			
			if successor_x > 0 && successor_x < obj_grid.gridSize
				&& successor_y > 0 && successor_y < obj_grid.gridSize
				&& ds_grid_get(grid, successor_x, successor_y) >= 0
				&& ds_list_find_index(closed, [successor_x, successor_y]) == -1
			{
				cost = i % 2 ? 1.4 : 1.0; 
				ds_priority_add(open, [successor_x, successor_y, q], cost + point_distance(successor_x, successor_y, xGoalShrunk, yGoalShrunk));
			}
			
		}
	}
}

function addInstancesWithWeights(grid, instanceId, weight)
{
	if (instance_exists(instanceId))
	{
		var i;
		for (i = 0; i < instance_number(instanceId); i++)
		{
			instance_find(instanceId, i);
		}
	}	
}