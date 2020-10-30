/// @description Insert description here
// You can write your code in this editor

audio_play_sound(snd_playerDefeat, 10, false);

part_emitter_region(global.particleSystem, global.destroyEmitter, 
							x + 10,
							x - 10,
							y + 10,
							y - 10,
							ps_shape_ellipse, ps_distr_gaussian);
			
part_type_direction(global.fragmentParticle, 0, 359, 0, 0);
			
part_emitter_burst(global.particleSystem, global.destroyEmitter, global.fragmentParticle, random_range(20, 30));