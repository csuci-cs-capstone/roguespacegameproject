/// @description Insert description here
// You can write your code in this editor

if dropMoney
{
	var dropped = irandom(value)

	var i, newScrap;
	for (i = dropped; i > 50; i -= 50)
	{
		dropped -= 50;
		newScrap = instance_create_layer(x, y, "Interactible", obj_scrap)
		newScrap.image_index = 4;
	}

	for (i = dropped; i > 25; i -= 25)
	{
		dropped -= 25;
		newScrap = instance_create_layer(x, y, "Interactible", obj_scrap)
		newScrap.image_index = 3;
	}

	for (i = dropped; i > 10; i -= 10)
	{
		dropped -= 10;
		newScrap = instance_create_layer(x, y, "Interactible", obj_scrap)
		newScrap.image_index = 2;
	}

	for (i = dropped; i > 5; i -= 5)
	{
		dropped -= 5;
		newScrap = instance_create_layer(x, y, "Interactible", obj_scrap)
		newScrap.image_index = 1;
	}

	for (i = dropped; i > 1; i -= 1)
	{
		dropped -= 1;
		newScrap = instance_create_layer(x, y, "Interactible", obj_scrap)
		newScrap.image_index = 0;
	}
	
	part_emitter_region(global.particleSystem, global.destroyEmitter, 
							x + 10,
							x - 10,
							y + 10,
							y - 10,
							ps_shape_ellipse, ps_distr_gaussian);
			
	part_type_direction(global.smallerFragmentParticle, 0, 359, 0, 0);
			
	part_emitter_burst(global.particleSystem, global.destroyEmitter, global.smallerFragmentParticle, random_range(20, 30));
	
	obj_universe.visitedSectors[? get_coordinates_string()].remove_enemy(object_index);
	obj_universe.visitedSectors[? get_coordinates_string()].sectorDanger -= danger;
}