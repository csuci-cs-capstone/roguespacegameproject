/// @description Insert description here
// You can write your code in this editor

audio_play_sound(snd_hit2, 0, false);

other.flash = 2
other.currentHealth -= damage

with(other)
{
	if object_index == obj_mine
	{
		alarm_set(0, room_speed)
		alarm_has_set = true
	}
}

instance_destroy();