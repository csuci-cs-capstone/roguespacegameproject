/// @description Insert description here
// You can write your code in this editor

if(instance_exists(obj_obstacleParent))
{
	mp_grid_clear_all(grid);
	mp_grid_add_instances(grid, obj_obstacleParent, false);
}