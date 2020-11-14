/// @description Insert description here
// You can write your code in this editor

instance_create_layer(x, y, "Interactible", obj_explosion2);

if !obj_player.dodging && distance_to_object(obj_player) <= 20
{
	audio_play_sound(snd_hit, 0, false);

	if obj_player.currentShields >= 0
	{
		obj_player.currentShields -= damage;
		obj_player.shieldAlpha = 1;
	}
	else
	{
		obj_player.currentHealth -= damage;
	}
}