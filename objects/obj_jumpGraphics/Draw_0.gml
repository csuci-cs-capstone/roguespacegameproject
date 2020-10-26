/// @description Insert description here
// You can write your code in this editor

if jump
{
	if not timerSet
	{
		alarm_set(0, room_speed)
		obj_drawUI.hideUI = true;
		timerSet = true;
	}
	draw_sprite_ext(spr_jumpBackground, 0, obj_player.x, obj_player.y + offset, 1, 1, jumpDirection, c_white, 1)
	draw_sprite_ext(spr_jumpBackground, 0, obj_player.x, obj_player.y + offset - 640, 1, 1, jumpDirection, c_white, 1)
	draw_sprite_ext(spr_jumpBackground, 1, obj_player.x, obj_player.y + ((2 * offset) % 640), 1, 1, jumpDirection, c_white, 1)
	draw_sprite_ext(spr_jumpBackground, 1, obj_player.x, obj_player.y + ((2 * offset) % 640) - 640, 1, 1, jumpDirection, c_white, 1)
	draw_sprite_ext(spr_jumpBackground, 2, obj_player.x, obj_player.y + ((5 * offset) % 640), 1, 1, jumpDirection, c_white, 1)
	draw_sprite_ext(spr_jumpBackground, 2, obj_player.x, obj_player.y + ((5 * offset) % 640) - 640, 1, 1, jumpDirection, c_white, 1)
	offset += 10
	if offset > 640
	{
		offset = 0;	
	}
}