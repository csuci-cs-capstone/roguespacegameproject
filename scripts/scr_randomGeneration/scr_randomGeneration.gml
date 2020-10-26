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
	var x0 = floor(_x);
	var x1 = x0 + 1;
	var y0 = floor(_y);
	var y1 = y0 + 1;
	
	var sx = _x - x0;
	var sy = _y - y0;
	
	var g0, g1, g2, g3, randDirection
	
	randDirection = vector_array[| (vector_array[| (x0 % 360)] + y0) % 360];
	g0 = new Vector2(lengthdir_x(1, randDirection), lengthdir_y(1, randDirection));
	
	randDirection = vector_array[| (vector_array[| (x1 % 360)] + y0) % 360];
	g1 = new Vector2(lengthdir_x(1, randDirection), lengthdir_y(1, randDirection));
	
	randDirection = vector_array[| (vector_array[| (x0 % 360)] + y1) % 360];
	g2 = new Vector2(lengthdir_x(1, randDirection), lengthdir_y(1, randDirection));
	
	randDirection = vector_array[| (vector_array[| (x1 % 360)] + y1) % 360];
	g3 = new Vector2(lengthdir_x(1, randDirection), lengthdir_y(1, randDirection));
	
	var d0, d1, d2, d3
	
	d0 = new Vector2(_x - x0, _y - y0);
	d1 = new Vector2(_x - x1, _y - y0);
	d2 = new Vector2(_x - x0, _y - y1);
	d3 = new Vector2(_x - x1, _y - y1);
	
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
	instance_destroy(obj_defaultEnemyParams);
	instance_destroy(obj_obstacleParent);
	instance_destroy(obj_projectileParent);
	instance_destroy(obj_enemyWeapons);
}

function generate_sector_from_data(sectorData)
{
	
	if sectorData.sectorDanger <= 0
	{
		// spawn shop
	}
	else
	{
		for (var i = 0; i < 10; i++)
		{
			instance_create_layer(random_range(300, room_width - 300), random_range(300, room_height - 300), "Interactible", obj_basicShip);	
		}
	}
	// instance_create_layer(random_range(300, room_width - 300), random_range(300, room_height - 300), "Interactible", obj_asteroid);
}

function sector_jump(jumpDirection)
{
	obj_universe.playerSectorX += ceil(lengthdir_x(1, jumpDirection))
	obj_universe.playerSectorY += ceil(lengthdir_y(1, -jumpDirection))
	obj_jumpGraphics.jumpDirection = jumpDirection;
	obj_jumpGraphics.jump = true;
}
