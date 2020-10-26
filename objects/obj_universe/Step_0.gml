/// @description Insert description here
// You can write your code in this editor

if generateSector
{
	remove_all_objects();
	instance_deactivate_object(obj_defaultEnemyParams);
	instance_deactivate_object(obj_obstacleParent);
	
	var sectorData;
	var coordinatesString = string(playerSectorX) + " " + string(playerSectorY)
	
	if ds_map_exists(visitedSectors, coordinatesString)
	{
		sectorData = visitedSectors[? coordinatesString];
		generate_sector_from_data(sectorData)
	}
	else
	{
		sectorData = new Sector(0, 0, sectorTypes.empty, [])
		ds_map_add(visitedSectors, (string(playerSectorX) + " " + string(playerSectorY)), sectorData)
		generate_sector_from_data(sectorData)
	}
	
	generateSector = false;
}