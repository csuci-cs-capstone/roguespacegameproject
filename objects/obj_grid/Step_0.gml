/// @description Insert description here
// You can write your code in this editor

if(instance_exists(obj_obstacleParent)) //constantly update flagged gridsquares
{
	mp_grid_clear_all(grid);
	mp_grid_add_instances(grid, obj_obstacleParent, false);
}

//ds_grid_set_region(grid2, 0, 0, gridSize, gridSize, 0);
//addInstancesWithWeights(grid2, obj_obstacleParent, 1.5);