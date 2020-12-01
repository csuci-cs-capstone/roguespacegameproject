/// @description Insert description here
// You can write your code in this editor

draw_set_alpha(1);
draw_text_transformed(display_get_gui_width()/2, 80, "ROGUE SPACE", 4, 4, 0);

if not starting
{
	draw_set_alpha(abs(dcos(alpha)));
	draw_text_transformed(display_get_gui_width()/2, 200, "PRESS ANY BUTTON TO START", 1, 1, 0);
}
else
{
	alphaValue = round(((alpha % 20) + 1) / 20);
	draw_set_alpha(alphaValue)
	draw_text_transformed(display_get_gui_width()/2, 200, "PRESS ANY BUTTON TO START", 1, 1, 0);
	if (previousAlphaValue == 0) && (alphaValue == 1)
	{
		flashCount++;	
	}
	
	draw_set_alpha(fadeToBlackAlpha)
	draw_set_color(c_black);
	draw_rectangle(0, 0, display_get_gui_width(), display_get_gui_height(), false);
	fadeToBlackAlpha += clamp((1/room_speed), 0, 1);
	draw_set_color(c_white);
}

if fadeToBlackAlpha == 1
{
	if !alarmSet
	{
		alarm_set(1, room_speed/2)
		alarmSet = true;
	}
}

if (flashCount < 4)
{
	alpha += 2;
	if alpha >= 360
	{
		alpha = 0;	
	}
}

if keyboard_check(vk_anykey) || mouse_check_button(mb_any)
{
	starting = true
	if playSound
	{
		audio_play_sound(snd_playerDefeat, 0, false);
		playSound = false
	}
}