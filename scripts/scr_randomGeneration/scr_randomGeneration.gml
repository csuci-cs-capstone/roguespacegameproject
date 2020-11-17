// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information

function populate_vector_array(vector_array)
{
	for (var i = 0; i < 360; i++)
	{
		vector_array[| i] = i
	}
	ds_list_shuffle(vector_array)
}

function fade(t)
{
	return (6 * power(t, 5) - 15 * power(t, 4) + 10 * power(t, 3));
}

function perlin_noise(_x, _y, vector_array)
{
	var x0 = floor(abs(_x));
	var x1 = x0 + 1;
	var y0 = floor(abs(_y));
	var y1 = y0 + 1;
	
	var sx = abs(_x) - x0;
	var sy = abs(_y) - y0;
	
	var g0, g1, g2, g3, randDirection
	
	randDirection = vector_array[| (vector_array[| (x0 % 359)] + y0) % 359];
	g0 = new Vector2(lengthdir_x(1, randDirection), lengthdir_y(1, randDirection));
	
	randDirection = vector_array[| (vector_array[| (x1 % 359)] + y0) % 359];
	g1 = new Vector2(lengthdir_x(1, randDirection), lengthdir_y(1, randDirection));
	
	randDirection = vector_array[| (vector_array[| (x0 % 359)] + y1) % 359];
	g2 = new Vector2(lengthdir_x(1, randDirection), lengthdir_y(1, randDirection));
	
	randDirection = vector_array[| (vector_array[| (x1 % 359)] + y1) % 359];
	g3 = new Vector2(lengthdir_x(1, randDirection), lengthdir_y(1, randDirection));
	
	var d0, d1, d2, d3
	
	d0 = new Vector2(abs(_x) - x0, abs(_y) - y0);
	d1 = new Vector2(abs(_x) - x1, abs(_y) - y0);
	d2 = new Vector2(abs(_x) - x0, abs(_y) - y1);
	d3 = new Vector2(abs(_x) - x1, abs(_y) - y1);
	
	var lerp1, lerp2, lerp3
	
	lerp1 = lerp(dot_product(d0.xV, d0.yV, g0.xV, g0.yV),
					dot_product(d1.xV, d1.yV, g1.xV, g1.yV),
					sx);
					
	lerp2 = lerp(dot_product(d2.xV, d2.yV, g2.xV, g2.yV),
					dot_product(d3.xV, d3.yV, g3.xV, g3.yV),
					sx);
					
	lerp3 = lerp(lerp1, lerp2, sy);
	
	return lerp3;
}

function remove_all_objects()
{
	if instance_exists(obj_defaultEnemyParams)
	{
		obj_defaultEnemyParams.dropMoney = false;
	}
	if instance_exists(obj_destroyableWeapon)
	{
		obj_destroyableWeapon.explode = false;
	}
	
	instance_destroy(obj_defaultEnemyParams);
	instance_destroy(obj_obstacleParent);
	instance_destroy(obj_projectileParent);
	instance_destroy(obj_enemyWeapons);
	instance_destroy(obj_destroyableWeapon);
	instance_destroy(obj_spaceStation);
	
	if instance_exists(obj_destroyableWeapon)
	{
		obj_destroyableWeapon.explode = true;
	}
	if instance_exists(obj_defaultEnemyParams)
	{
		obj_defaultEnemyParams.dropMoney = true;
	}
}

function generate_sector_from_data(sectorData)
{
	#region //Mass value
	// instance_create_layer(random_range(300, room_width - 300), random_range(300, room_height - 300), "Interactible", obj_asteroid
	
	if sectorData.sectorMass >= 0
	{
		for (var i = 0; i < sectorData.sectorMass; i++)
		{
			instance_create_layer(random_range(100, room_width - 100), random_range(100, room_height - 100), "Interactible", obj_asteroid);
		}
	}
	
	#endregion
	
	#region //Danger value
	if sectorData.sectorDanger < 0
	{
		if sectorData.sectorShopRotation == -1
		{
			sectorData.sectorShopRotation = random_range(0, 360)
		}
		var station = instance_create_layer(room_width/2, room_height/2, "Interactible", obj_spaceStation)
		station.image_angle = sectorData.sectorShopRotation;
	}
	else if sectorData.sectorDanger > 0
	{
		if ds_map_empty(sectorData.sectorEnemyList) // If there are no enemies in the enemy list, and the danger is not 0, then new enemies will be generated
		{
			var dangerCount = sectorData.sectorDanger;
			while dangerCount > 0
			{
				switch (irandom_range(1, ((dangerCount >= 1) + (dangerCount >= 2) + (dangerCount >= 4) + (dangerCount >= 7) + (dangerCount >= 10))))
				{
					case 5:
						instance_create_layer(random_range(300, room_width - 300), random_range(300, room_height - 300), "Interactible", obj_sniper);
						sectorData.add_enemy(obj_sniper)
						dangerCount -= obj_sniper.danger;
						break;
					case 4:
						var enemy = choose(obj_mineLayer, obj_launcher)
						instance_create_layer(random_range(300, room_width - 300), random_range(300, room_height - 300), "Interactible", enemy);
						sectorData.add_enemy(enemy)
						dangerCount -= enemy.danger;
						break;
					case 3:
						instance_create_layer(random_range(300, room_width - 300), random_range(300, room_height - 300), "Interactible", obj_dodger);
						sectorData.add_enemy(obj_dodger)
						dangerCount -= obj_dodger.danger;
						break;
					case 2:
						instance_create_layer(random_range(300, room_width - 300), random_range(300, room_height - 300), "Interactible", obj_spreadShot);
						sectorData.add_enemy(obj_spreadShot)
						dangerCount -= obj_spreadShot.danger;
						break;
					case 1:
						instance_create_layer(random_range(300, room_width - 300), random_range(300, room_height - 300), "Interactible", obj_basicShip);
						sectorData.add_enemy(obj_basicShip)
						dangerCount -= obj_basicShip.danger;
						break;
				}
			}
		}
		else
		{
			for (var i = ds_map_find_first(sectorData.sectorEnemyList); !is_undefined(i); i = ds_map_find_next(sectorData.sectorEnemyList, i))
			{
				for (var j = 0; j < sectorData.sectorEnemyList[? i]; j++)
				{
					instance_create_layer(random_range(300, room_width - 300), random_range(300, room_height - 300), "Interactible", i);
				}
			}
		}
	}
	#endregion
}

function sector_jump(jumpDirection)
{
	audio_pause_all();
	audio_play_sound(snd_jump, 0, true);
	
	obj_universe.playerSectorX += ceil(lengthdir_x(1, jumpDirection))
	obj_universe.playerSectorY += ceil(lengthdir_y(1, -jumpDirection))
	obj_universe.generateSector = true;
	obj_jumpMechanics.jumpDirection = jumpDirection;
	obj_jumpMechanics.jump = true;
}

function get_coordinates_string()
{
	return string(obj_universe.playerSectorX) + " " + string(obj_universe.playerSectorY)	
}

function get_distance_from_center()
{
	return abs(obj_universe.playerSectorX) + abs(obj_universe.playerSectorY)
}