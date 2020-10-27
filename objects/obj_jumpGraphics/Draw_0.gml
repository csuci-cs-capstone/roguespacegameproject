/// @description Insert description here
// You can write your code in this editor

if jump
{
	if not timerSet
	{
		alarm_set(0, room_speed)
		obj_drawUI.hideUI = true;
		timerSet = true;
		offsetx = 0;
		offsety = 0;
	}
	var xMult = lengthdir_x(1, jumpDirection)
	var yMult = lengthdir_y(1, jumpDirection)
	draw_sprite_ext(spr_jumpBackground, 0, obj_player.x + offsetx,									obj_player.y + offsety,									1, 1, jumpDirection - 90, c_white, 1)
	draw_sprite_ext(spr_jumpBackground, 0, obj_player.x + offsetx + (640 * xMult),					obj_player.y + offsety + (640 * yMult),					1, 1, jumpDirection - 90, c_white, 1)
	draw_sprite_ext(spr_jumpBackground, 1, obj_player.x + ((2 * offsetx) % 640),					obj_player.y + ((2 * offsety) % 640),					1, 1, jumpDirection - 90, c_white, 1)
	draw_sprite_ext(spr_jumpBackground, 1, obj_player.x + ((2 * offsetx) % 640) + (640 * xMult),	obj_player.y + ((2 * offsety) % 640) + (640 * yMult),	1, 1, jumpDirection - 90, c_white, 1)
	draw_sprite_ext(spr_jumpBackground, 2, obj_player.x + ((5 * offsetx) % 640),					obj_player.y + ((5 * offsety) % 640),					1, 1, jumpDirection - 90, c_white, 1)
	draw_sprite_ext(spr_jumpBackground, 2, obj_player.x + ((5 * offsetx) % 640) + (640 * xMult),	obj_player.y + ((5 * offsety) % 640) + (640 * yMult),	1, 1, jumpDirection - 90, c_white, 1)
	offsetx -= 10 * xMult
	offsety -= 10 * yMult
	if offsetx > 640
	{
		offsetx = 0;	
	}
	if offsety > 640
	{
		offsety = 0;
	}
}