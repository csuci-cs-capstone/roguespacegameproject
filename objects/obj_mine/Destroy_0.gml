/// @description Insert description here
// You can write your code in this editor

if explode
{
	instance_create_layer(x, y, "Interactible", obj_explosion);

	var damageRadius = ds_list_create();

	collision_circle_list(x, y, 80, obj_defaultEnemyParams, false, true, damageRadius, false);


	for (var i = 0; i < ds_list_size(damageRadius); i++)
	{
		var currentObject = damageRadius[| i]
		with (currentObject)
		{
			audio_stop_sound(snd_hit2)
			audio_play_sound(snd_hit2, 0, false);
			flash = 2
			currentHealth -= (obj_mine.damage)/4;
		}
	}

	if instance_exists(obj_player) && !obj_player.dodging && distance_to_object(obj_player) <= 55
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


	ds_list_destroy(damageRadius)
}