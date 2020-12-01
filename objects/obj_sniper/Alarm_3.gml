/// @description Insert description here
// You can write your code in this editor

drawLine = !drawLine
audio_play_sound(snd_sniperBeep, 0, false);
alarm_set(3, alarm_get(0)/5)