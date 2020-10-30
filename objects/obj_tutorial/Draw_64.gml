/// @description Insert description here
// You can write your code in this editor

if global.doTutorial
{
	if count == room_speed * 4
	{
		count = 0
	}
	count++;
	
	switch(step)
	{
		case 0:
			draw_sprite(spr_WASDTut, count/room_speed, 0, 0)
			if keyboard_check(ord("W")) || keyboard_check(ord("A")) || keyboard_check(ord("S")) || keyboard_check(ord("D"))
			{
				step = 1;	
			}
			break;
		case 1:
			draw_sprite(spr_mouseTut, count/room_speed, 0, 0)
			if mouse_check_button(mb_left) || mouse_check_button(mb_right)
			{
				step = 2;	
			}
			break;
		case 2:
			if !keyboard_check(vk_tab)
			{
				draw_sprite(spr_tabTut, (count/room_speed)%2, 0, 0)
			}
			if keyboard_check_released(vk_tab)
			{
				step = 3;	
			}
			break;
		case 3:
			if keyboard_check(vk_shift)
			{
				draw_sprite(spr_mouseTut, (count/room_speed)%2, 0, 0)
				if mouse_check_button(mb_left)
				{
					step = 4;
					global.doTutorial = false;
				}
			}
			else
			{
				draw_sprite(spr_shiftTut, (count/room_speed)%2, 0, 0)
			}
			break;
	}
}