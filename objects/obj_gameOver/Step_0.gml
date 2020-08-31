/// @description Insert description here
// You can write your code in this editor

if (health <= 0)
{
	instance_destroy(obj_player);
	dead = true;
	health = 0;
	
	if (keyboard_check_pressed(vk_space))
	{
		room_restart();
	}
}