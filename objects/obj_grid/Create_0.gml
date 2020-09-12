/// @description Insert description here
// You can write your code in this editor

gridSize = 50; //size of each grid square in pixels

grid = mp_grid_create(0, 0, room_width/gridSize, room_height/gridSize, gridSize, gridSize);

grid2 = ds_grid_create(gridSize, gridSize);
ds_grid_set_region(grid2, 0, 0, gridSize, gridSize, 0)

path = path_add();