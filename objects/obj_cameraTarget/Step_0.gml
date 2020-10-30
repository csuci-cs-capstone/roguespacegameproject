/// @description Insert description here
// You can write your code in this editor

if !obj_jumpGraphics.jump
{
	if distanceToPlayer != 0.2
	{
		distanceToPlayer = 0.2
	}
	x = lerp(obj_player.phy_position_x, mouse_x, distanceToPlayer)
	y = lerp(obj_player.phy_position_y, mouse_y, distanceToPlayer)
}
else
{
	x = obj_player.phy_position_x
	y = obj_player.phy_position_y
	window_mouse_set(window_get_width()/2, window_get_height()/2);
}