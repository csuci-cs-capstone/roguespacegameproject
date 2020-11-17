/// @description Insert description here
// You can write your code in this editor

if drawSectorName && !jump
{
	draw_set_halign(fa_center);
	draw_set_alpha(alarm_get(2)/room_speed);
	draw_text_transformed(320, 50, "SECTOR [" + string(obj_universe.playerSectorX) + ", " + string(obj_universe.playerSectorY) + "]", 3, 3, 0);
	draw_set_alpha(1);
	draw_set_halign(fa_left);
}