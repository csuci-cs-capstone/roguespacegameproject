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

Sector = function(_x, _y, _hasShop, _mass, _danger) constructor
{
	sectorX = _x
	sectorY = _y
	sectorMass = _mass;
	sectorDanger = _danger;
	sectorType = sectorTypes.empty;
	sectorHasShop = _hasShop;
	sectorShopRotation = -1;
	
	sectorShopInv = 0;
	
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
	
	static initialize_shop_inv = function()
	{
		sectorShopInv = ds_list_create()	
	}
	
	static addItemToShop = function(item)
	{
		ds_list_insert(sectorShopInv, 0, item)	
	}
	
	static removeItemFromShop = function(item)
	{
		ds_list_delete(sectorShopInv, ds_list_find_index(sectorShopInv, item))	
	}
}

visitedSectors = ds_list_create();
generatedSectors = ds_map_create();

ds_list_add(visitedSectors, (string(playerSectorX) + " " + string(playerSectorY)))
ds_map_add(generatedSectors, (string(playerSectorX) + " " + string(playerSectorY)), new Sector(0, 0, false, 0, 0))
generate_sector_data_in_radius(playerSectorX, playerSectorY, 5)

#endregion

generateSector = false;
activate = true;