/// @description Insert description here
// You can write your code in this editor

if paused
{
	if !surface_exists(pauseBackground)
	{
		pauseBackground = surface_create(surface_get_width(application_surface), surface_get_height(application_surface));
		
		surface_copy(pauseBackground, 0, 0, application_surface);
		
		physics_pause_enable(true);
		instance_deactivate_all(true);
		audio_pause_all();
	}
}