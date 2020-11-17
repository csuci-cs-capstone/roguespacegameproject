/// @description Insert description here
// You can write your code in this editor

if generateSector
{
	remove_all_objects();
	
	var sectorData;
	var coordinatesString = string(playerSectorX) + " " + string(playerSectorY)
	
	generate_sector_data_in_radius(playerSectorX, playerSectorY, 4)
	
	if ds_list_find_index(visitedSectors, coordinatesString) == -1
	{
		ds_list_add(visitedSectors, coordinatesString)
	}
	
	sectorData = generatedSectors[? coordinatesString];
	generate_sector_from_data(sectorData)
	
	instance_deactivate_object(obj_defaultEnemyParams);
	instance_deactivate_object(obj_spaceStation);
	instance_deactivate_object(obj_obstacleParent);
	
	// ds_map_destroy(sectorData.sectorEnemyList);
	
	generateSector = false;
}

if activate
{
	instance_activate_object(obj_defaultEnemyParams);
	instance_activate_object(obj_spaceStation);
	instance_activate_object(obj_obstacleParent);
	
	activate = false;
}