/// @description Insert description here
// You can write your code in this editor
if !obj_jumpMechanics.jump
{
	draw_sprite_ext(spr_explosion2, 0, x, y, 1, 1, 0, c_white, alarm_get(0)/(room_speed))
}