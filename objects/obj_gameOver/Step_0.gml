/// @description Insert description here
// You can write your code in this editor

if !dead && (obj_player.currentHealth <= 0)
{
	audio_stop_all()
	instance_destroy(obj_weaponController);
	instance_destroy(obj_target);
	instance_destroy(obj_leftWeapon);
	instance_destroy(obj_rightWeapon);
	instance_destroy(obj_player);
	dead = true;
	if !alarmSet
	{
		alarm_set(0, room_speed*2);
		alarmSet = true;
	}
}

if dead && showReset
{
	if (keyboard_check_released(vk_space))
	{
		room_restart();
	}
}