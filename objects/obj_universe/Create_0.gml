/// @description Insert description here
// You can write your code in this editor

#region //Data for Perlin
Vector2 = function(_x, _y) constructor
{
	xV = _x
	yV = _y
}

vector_array = ds_list_create();
populate_vector_array(vector_array)
#endregion

#region //Sector Data

//Player Sector Coordinates
playerSectorX = 0;
playerSectorY = 0;

enum sectorTypes
{
	empty,
	nebula,
	asteroid,
	ice_asteroids,
	volcanic_planet,
	rocky_planet,
	gas_planet,
	gas_planet_rings,
	normal_star,
	neutron_star,
	black_hole,
}

Sector = function(_mass, _danger, _type, _shopInv) constructor
{
	sectorMass = _mass
	sectorDanger = _danger
	sectorType = _type
	sectorShopInv = _shopInv
}

visitedSectors = ds_map_create();

ds_map_add(visitedSectors, (string(playerSectorX) + " " + string(playerSectorY)), new Sector(0, 0, sectorTypes.empty, []))

#endregion

generateSector = false;