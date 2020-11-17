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
		var dangerValue = (perlin_noise(playerSectorX/2, playerSectorX/2, vector_array) * 20) + 5
		
		if dangerValue > 0
		{
			dangerValue += get_distance_from_center() * 2	
		}
		
		var massValue = (perlin_noise(playerSectorX/2, playerSectorX/2, vector_array) * 10) + 10
		sectorData = new Sector(playerSectorX, playerSectorY, massValue, dangerValue)
		ds_map_add(visitedSectors, (string(playerSectorX) + " " + string(playerSectorY)), sectorData)
		generate_sector_from_data(sectorData)
	}
	
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