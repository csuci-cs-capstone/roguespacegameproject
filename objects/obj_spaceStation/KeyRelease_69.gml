/// @description Insert description here
// You can write your code in this editor

if closeEnough
{
	if instance_exists(obj_player) && obj_player.money > 20
	{
		obj_player.money -= 20;
		obj_player.currentHealth += 10;
	}
}