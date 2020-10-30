/// @description Insert description here
// You can write your code in this editor

obj_drawUI.hideUI = false;
timerSet = false;
jump = false;
audio_stop_sound(snd_jump);
audio_resume_all();
audio_play_sound(snd_jumpDone, 3, false);

if instance_exists(obj_player)
{
	part_emitter_region(global.particleSystem, global.jumpChargeEmitter, 
							obj_player.x + 80,
							obj_player.x - 80,
							obj_player.y + 80,
							obj_player.y - 80,
							ps_shape_ellipse, ps_distr_gaussian);
			
	part_type_direction(global.jumpParticle, 0, 359, 0, 0);
			
	part_emitter_burst(global.particleSystem, global.jumpChargeEmitter, global.jumpParticle, random_range(40, 50));
}

alarm_set(1, room_speed * 1.5)

obj_universe.activate = true;