/// @description Insert description here
// You can write your code in this editor

if paused
{
	if surface_exists(pauseBackground)
	{
		draw_surface_stretched(pauseBackground, 0, 0, display_get_gui_width(), display_get_gui_height());
	}
	
	mousex = window_mouse_get_x() / round(view_wport[0]/640);
	mousey = window_mouse_get_y() / round(view_hport[0]/360);
	
	draw_sprite(spr_pauseMenu, 0, 0, 0);
	
	draw_sprite(spr_volRes, 0, 264, 91);
	
	if point_in_rectangle(mousex, mousey, 273, 209, 368, 230)
	{
		draw_sprite(spr_resetButton, 1, 273, 209);
		if mouse_check_button_released(mb_left)
		{
			room_restart();
		}
	}
	else
	{
		draw_sprite(spr_resetButton, 0, 273, 209);
	}
	
	if point_in_rectangle(mousex, mousey, 273, 238, 368, 259)
	{
		draw_sprite(spr_quitButton, 1, 273, 238);
		if mouse_check_button_released(mb_left)
		{
			game_end();
		}
	}
	else
	{
		draw_sprite(spr_quitButton, 0, 273, 238);
	}
	
	draw_sprite(spr_cursor, 0, mousex, mousey);
}