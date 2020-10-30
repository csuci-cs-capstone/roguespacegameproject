/// @description Insert description here
// You can write your code in this editor

if generateSector
{
	remove_all_objects();
	
	var sectorData;
	var coordinatesString = string(playerSectorX) + " " + string(playerSectorY)
	
	if ds_map_exists(visitedSectors, coordinatesString)
	{
		sectorData = visitedSectors[? coordinatesString];
		generate_sector_from_data(sectorData)
	}
	else
	{
		sectorData = new Sector(playerSectorX, playerSectorY, random_range(0, 20), random_range(10, 50))
		ds_map_add(visitedSectors, (string(playerSectorX) + " " + string(playerSectorY)), sectorData)
		generate_sector_from_data(sectorData)
	}
	
	instance_deactivate_object(obj_defaultEnemyParams);
	instance_deactivate_object(obj_obstacleParent);
	
	// ds_map_destroy(sectorData.sectorEnemyList);
	
	generateSector = false;
}

if activate
{
	instance_activate_object(obj_defaultEnemyParams);
	instance_activate_object(obj_obstacleParent);
	
	activate = false;
}