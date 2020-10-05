// @function				draw_radar_blip(_object, _sprite);
// @param {index} _object	Object to track
// @param {index} _sprite	Sprite to represent object in radar

function draw_radar_blip(_object, _sprite)
{
	with (_object)
	{
		draw_sprite(_sprite, -1, (575 + (x / 21.5517241379)) * (view_wport[0] / 640), (295  + (y / 21.5517241379)) * (view_hport[0] / 360))
	}
}

function draw_menu()
{
	if (keyboard_check(vk_tab))
{
	draw_sprite_ext(spr_menu, -1, 0, 0, view_wport[0]/640, view_hport[0]/360, 0, c_white, 1);
	var mousex, mousey;
	mousex = window_mouse_get_x() / round(view_wport[0]/640);
	mousey = window_mouse_get_y() / round(view_hport[0]/360);
	if (mousex >= 91 && mousex <= 145 && mousey >= 51 && mousey <= 75)
	{
		draw_sprite_ext(spr_mapButton, 1, 91 * view_wport[0]/640, 51 * view_hport[0]/360, view_wport[0]/640, view_hport[0]/360, 0, c_white, 1);
		if mouse_check_button(mb_left)
		{
			draw_sprite_ext(spr_mapButton, 2, 91 * view_wport[0]/640, 51 * view_hport[0]/360, view_wport[0]/640, view_hport[0]/360, 0, c_white, 1);
			menuMode = 0;
		}
	}
	else
	{
		draw_sprite_ext(spr_mapButton, 0, 91 * view_wport[0]/640, 51 * view_hport[0]/360, view_wport[0]/640, view_hport[0]/360, 0, c_white, 1);
	}
	if (mousex >= 149 && mousex <= 203 && mousey >= 51 && mousey <= 75)
	{
		draw_sprite_ext(spr_invButton, 1, 149 * view_wport[0]/640, 51 * view_hport[0]/360, view_wport[0]/640, view_hport[0]/360, 0, c_white, 1);
		if mouse_check_button(mb_left)
		{
			draw_sprite_ext(spr_invButton, 2, 149 * view_wport[0]/640, 51 * view_hport[0]/360, view_wport[0]/640, view_hport[0]/360, 0, c_white, 1);
			menuMode = 1;
		}
	}
	else
	{
		draw_sprite_ext(spr_invButton, 0, 149 * view_wport[0]/640, 51 * view_hport[0]/360, view_wport[0]/640, view_hport[0]/360, 0, c_white, 1);
	}
	if menuMode == 0
	{
		
	}
	else
	{
		draw_sprite_ext(spr_invMenu, -1, 0, 0, view_wport[0]/640, view_hport[0]/360, 0, c_white, 1);
	}
}	
}