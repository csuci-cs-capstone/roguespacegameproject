/// @description Insert description here
// You can write your code in this editor

part_emitter_region(global.particleSystem, global.projectileTrailEmitter, 
						x + 1 + lengthdir_x(-1, -phy_rotation), 
						x - 1 + lengthdir_x(-1, -phy_rotation),
						y + 1 + lengthdir_y(-1, -phy_rotation),
						y - 1 + lengthdir_y(-1, -phy_rotation),
						ps_shape_ellipse, ps_distr_gaussian);
			
part_type_direction(global.bulletTrail, (-phy_rotation + 180), (-phy_rotation + 180), 0, 0);
			
part_emitter_burst(global.particleSystem, global.projectileTrailEmitter, global.bulletTrail, 3);