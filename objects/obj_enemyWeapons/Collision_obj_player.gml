/// @description Player Damage
// You can write your code in this editor

if instance_exists(obj_jumpMechanics) && !obj_jumpMechanics.immune
{
	audio_play_sound(snd_hit, 0, false);

	if other.currentShields >= 0
	{
		other.currentShields -= damage;
		other.shieldAlpha = 1;
	}
	else
	{
		other.currentHealth -= damage;
	}
}

instance_destroy();