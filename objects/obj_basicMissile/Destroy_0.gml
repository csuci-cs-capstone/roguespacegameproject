/// @description Insert description here
// You can write your code in this editor

if explode
{
	instance_create_layer(x, y, "Interactible", obj_explosion2);

	var damageRadius = ds_list_create();

	collision_circle_list(x, y, 35, obj_defaultEnemyParams, false, true, damageRadius, false);

	for (var i = 0; i < ds_list_size(damageRadius); i++)
	{
		var currentObject = damageRadius[| i]
		
		
		with (currentObject)
		{
			currentHealth -= other.damage;
			physics_apply_impulse(x, y, lengthdir_x(50, point_direction(other.x, other.y, x, y)), lengthdir_y(50, point_direction(other.x, other.y, x, y)))
			audio_stop_sound(snd_hit2)
			audio_play_sound(snd_hit2, 0, false);
			flash = 2
		}
	}
	
	ds_list_clear(damageRadius)
	
	collision_circle_list(x, y, 35, obj_destroyableWeapon, false, true, damageRadius, false);

	for (var i = 0; i < ds_list_size(damageRadius); i++)
	{
		var currentObject = damageRadius[| i]
		
		with (currentObject)
		{
			currentHealth -= other.damage;
			physics_apply_impulse(x, y, lengthdir_x(50, point_direction(other.x, other.y, x, y)), lengthdir_y(50, point_direction(other.x, other.y, x, y)))
			audio_stop_sound(snd_hit2)
			audio_play_sound(snd_hit2, 0, false);
			if object_index == obj_mine
			{
				alarm_set(0, room_speed)
				alarm_has_set = true
			}
			flash = 2
		}
	}

	if instance_exists(obj_player) && !obj_player.dodging && distance_to_object(obj_player) <= 20
	{
		audio_play_sound(snd_hit, 0, false);
		
		with(obj_player)
		{
			physics_apply_impulse(x, y, lengthdir_x(50, point_direction(other.x, other.y, x, y)), lengthdir_y(50, point_direction(other.x, other.y, x, y)))
		}
		
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
	
	audio_play_sound(snd_explosion, 1, false)
	
	ds_list_destroy(damageRadius);
}