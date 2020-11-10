/// @description Insert description here
// You can write your code in this editor

if drawLine
{
	draw_set_colour(c_red);
	if instance_exists(obj_player) && canSee
	{
		draw_line(x, y, obj_player.x, obj_player.y)
	}
	draw_set_colour(c_white);
}

// Inherit the parent event
event_inherited();