/// @description Insert description here
// You can write your code in this editor

for (var i = ds_map_find_first(visitedSectors); !is_undefined(i); i = ds_map_find_next(visitedSectors, i))
{
	if ds_exists(visitedSectors[? i].sectorEnemyList, ds_type_map)
	{
		ds_map_destroy(visitedSectors[? i].sectorEnemyList);
	}
	if ds_exists(visitedSectors[? i].sectorShopInv, ds_type_list)
	{
		ds_list_destroy(visitedSectors[? i].sectorShopInv);
	}
}

ds_list_destroy(visitedSectors);
ds_map_destroy(generatedSectors);