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

Sector = function(_x, _y, _mass, _danger) constructor
{
	sectorX = _x
	sectorY = _y
	sectorMass = _mass;
	sectorDanger = _danger;
	sectorType = sectorTypes.empty;
	sectorShopRotation = -1;
	sectorShopInv = [];
	sectorEnemyList = ds_map_create();
	
	static add_enemy = function(enemy)
	{
		if not ds_map_add(sectorEnemyList, enemy, 1)
		{
			sectorEnemyList[? enemy] += 1	
		}
	}
	
	static remove_enemy = function(enemy)
	{
		if !is_undefined(ds_map_find_value(sectorEnemyList, enemy))
		{
			if sectorEnemyList[? enemy] == 1
			{
				ds_map_delete(sectorEnemyList, enemy)	
			}
			else
			{
				sectorEnemyList[? enemy] -= 1;
			}
		}
	}
}

visitedSectors = ds_map_create();

ds_map_add(visitedSectors, (string(playerSectorX) + " " + string(playerSectorY)), new Sector(0, 0, 0, 0))

#endregion

generateSector = false;
activate = true;