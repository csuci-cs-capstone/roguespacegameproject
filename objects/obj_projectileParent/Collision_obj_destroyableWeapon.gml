/// @description Insert description here
// You can write your code in this editor

audio_play_sound(snd_hit2, 0, false);

other.flash = 2
if instance_exists(obj_player)
{
	other.currentHealth -= get_stat("damageStat")
}
instance_destroy();