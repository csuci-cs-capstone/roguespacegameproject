/// @description Insert description here
// You can write your code in this editor

//phy_rotation = -point_direction(x, y, mouse_x, mouse_y);
phy_rotation = -aimTowards;
physics_apply_impulse(x, y, obj_player.phy_speed_x + lengthdir_x(get_stat("projectileSpeedStat"), -phy_rotation), obj_player.phy_speed_y + lengthdir_y(get_stat("projectileSpeedStat"), -phy_rotation))
//phy_speed_x = 
//phy_speed_y = 

alarm_set(0, 2 * room_speed);

part_emitter_region(global.particleSystem, global.gunFlashParticleEmitter, 
						x + 1 + lengthdir_x(7, -phy_rotation), 
						x - 1 + lengthdir_x(7, -phy_rotation),
						y + 1 + lengthdir_y(7, -phy_rotation),
						y - 1 + lengthdir_y(7, -phy_rotation),
						ps_shape_ellipse, ps_distr_gaussian);
			
part_type_direction(global.gunFlashParticle, -phy_rotation - 45, -phy_rotation + 45, 0, 0);
			
part_emitter_burst(global.particleSystem, global.gunFlashParticleEmitter, global.gunFlashParticle, 7);