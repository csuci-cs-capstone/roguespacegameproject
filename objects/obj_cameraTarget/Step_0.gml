/// @description Insert description here
// You can write your code in this editor

if instance_exists(obj_player)
{
	if keyboard_check(vk_shift)
	{
		distanceToPlayer /= 1.2
		x = lerp(obj_player.phy_position_x, mouse_x, distanceToPlayer)
		y = lerp(obj_player.phy_position_y, mouse_y, distanceToPlayer)
	}
	else if !obj_jumpMechanics.jump
	{
		if distanceToPlayer != 0.2
		{
			distanceToPlayer += (0.2 - distanceToPlayer)/4
		}
		x = lerp(obj_player.phy_position_x, mouse_x, distanceToPlayer)
		y = lerp(obj_player.phy_position_y, mouse_y, distanceToPlayer)
	}
	else
	{
		x = obj_player.phy_position_x
		y = obj_player.phy_position_y
		x += choose(-2, -1, 1, 2);
		y += choose(-2, -1, 1, 2);
		window_mouse_set(window_get_width()/2, window_get_height()/2);
	}
}

if shake
{
	x += choose(-1, 1);
	y += choose(-1, 1);
}