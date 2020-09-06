// @function				physics_pathfind(_force, _x, _y);
// @param {index} _path		Path variable used for pathfinding
// @param {index} _grid		Grid to use for pathfinding
// @param {real} _force		Amount of force desired to move to the next waypoint
// @param {real} _xStart		X coordinate of start
// @param {real} _yStart		Y coordinate of start
// @param {real} _xGoal		X coordinate of destination
// @param {real} _yGoal		Y coordinate of destination

function physics_pathfind(_path, _grid, _force, _xStart, _yStart, _xGoal, _yGoal){

	mp_grid_path(_grid, _path, _xStart, _yStart, _xGoal, _yGoal, true);	// Fill the path based on the grid
	
	var theta = point_direction(_xStart, _yStart, path_get_point_x(_path, 1), path_get_point_y(_path, 1));	// Direction towards next path waypoint
	
	return [lengthdir_x(_force, theta), lengthdir_y(_force, theta)];
}