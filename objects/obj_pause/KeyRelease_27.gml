/// @description Insert description here
// You can write your code in this editor

paused = !paused

if !paused
{
	drawn = false;
	physics_pause_enable(false);
	instance_activate_all();
	surface_free(pauseBackground);
	pauseBackground = -1;
	audio_resume_all();
}