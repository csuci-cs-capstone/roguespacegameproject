/// @description Collision Damage
// You can write your code in this editor

// Inherit the parent event
event_inherited();

if !obj_jumpGraphics.immune
{
	if playHitSound
	{
		audio_play_sound(snd_hit, 0, false);
		alarm_set(2, room_speed/2)
		playHitSound = false;
	}

	if currentShields >= 0
	{
		shieldAlpha = 1;
		currentShields -= phy_mass * power(speedChange, 2) * 0.5
	}
	else
	{
		currentHealth -= phy_mass * power(speedChange, 2) * 0.5
	}
}