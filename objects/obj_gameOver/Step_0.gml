/// @description Insert description here
// You can write your code in this editor

if !dead && (obj_player.currentHealth <= 0)
{
	audio_stop_all()
	instance_destroy(obj_leftWeapon);
	instance_destroy(obj_rightWeapon);
	instance_destroy(obj_player);
	dead = true;
}

if dead
{
	if (keyboard_check_pressed(vk_space))
	{
		room_restart();
	}
}