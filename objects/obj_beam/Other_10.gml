/// @description Insert description here
// You can write your code in this editor

if !canDestroy && instance_exists(obj_jumpMechanics) && !obj_jumpMechanics.immune
{
	audio_play_sound(snd_hit, 0, false);
	canDestroy = true;
	phy_active = false;
	
	if obj_player.currentShields >= 0
	{
		obj_player.currentShields -= damage;
		obj_player.shieldAlpha = 1;
	}
	else
	{
		obj_player.currentHealth -= (damage - (damage * (get_stat("armorStat") / 100)));
	}
}