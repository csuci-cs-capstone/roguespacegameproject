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

// @function	draw_menu();
function draw_menu()
{
	draw_sprite_ext(spr_menu, -1, 0, 0, view_wport[0]/640, view_hport[0]/360, 0, c_white, 1);
	if (point_in_rectangle(mousex, mousey, 91, 41, 145, 75))
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
	if (point_in_rectangle(mousex, mousey, 149, 51, 203, 75))
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
		draw_inventory(98, 86, 4, 8, obj_player.inventory)
		draw_info(obj_player.inventory)
	}
}


function draw_inventory(originx, originy, spacing, columns, list)
{
	var i, sprite, curRow, curColumn, curX, curY;
	curRow = 0;
	curColumn = 0;
	var spriteSize = sprite_get_width(spr_invBox);
	for (i = 0; i < ds_list_size(list); i++)
	{
		curX = ((spriteSize + spacing) * curColumn) + originx;
		curY = ((spriteSize + spacing) * curRow) + originy;
		if point_in_rectangle(mousex, mousey, curX, curY, curX + 35, curY + 35)
		{
			draw_sprite_ext(spr_invBox, 1, curX * view_wport[0]/640, curY * view_hport[0]/360, view_wport[0]/640, view_hport[0]/360, 0, c_white, 1);
			if mouse_check_button(mb_left)
			{
				infoIndex = i;
			}
		}
		else
		{
			draw_sprite_ext(spr_invBox, 0, curX * view_wport[0]/640, curY * view_hport[0]/360, view_wport[0]/640, view_hport[0]/360, 0, c_white, 1);
		}
		sprite = list[| i].itemSprite
		draw_sprite_ext(sprite, 0, (curX + 17) * view_wport[0]/640, (curY + 17) * view_hport[0]/360, view_wport[0]/640, view_hport[0]/360, 0, c_white, 1);
		
		curColumn++;
		if curColumn >= columns
		{
			curColumn = 0;
			curRow++;
		}

	}
}

function draw_info(list)
{
	if infoIndex == -1
	{
		draw_sprite_ext(spr_player, 0, 492 * view_wport[0]/640, 137 * view_hport[0]/360, 2 * view_wport[0]/640, 2 * view_hport[0]/360, 90, c_white, 1);
		
		draw_text_transformed(460 * view_wport[0]/640, 190 * view_hport[0]/360, string(obj_player.maxHealth), view_wport[0]/640, view_hport[0]/360, 0);
		
		draw_text_transformed(460 * view_wport[0]/640, 203 * view_hport[0]/360, string(obj_player.armor), view_wport[0]/640, view_hport[0]/360, 0);
		
		draw_text_transformed(460 * view_wport[0]/640, 216 * view_hport[0]/360, string(obj_player.shields), view_wport[0]/640, view_hport[0]/360, 0);
		
		draw_text_transformed(460 * view_wport[0]/640, 229 * view_hport[0]/360, string(obj_player.enginePower), view_wport[0]/640, view_hport[0]/360, 0);
		
		draw_text_transformed(507 * view_wport[0]/640, 190 * view_hport[0]/360, string(obj_player.dodgeSpeedMult), view_wport[0]/640, view_hport[0]/360, 0);
		
		draw_text_transformed(507 * view_wport[0]/640, 203 * view_hport[0]/360, string(obj_player.dodgeRecharge), view_wport[0]/640, view_hport[0]/360, 0);
		
		draw_text_transformed(507 * view_wport[0]/640, 216 * view_hport[0]/360, string(obj_player.weaponDamageMult), view_wport[0]/640, view_hport[0]/360, 0);
		
		draw_text_transformed(507 * view_wport[0]/640, 229 * view_hport[0]/360, string(obj_player.weaponFirerateMult), view_wport[0]/640, view_hport[0]/360, 0);
		
		draw_text_ext_transformed(445 * view_wport[0]/640, 245 * view_hport[0]/360, string(obj_player.description), 8, 184, (view_wport[0]/640)/2, (view_hport[0]/360)/2, 0);
	}
	else
	{
		var sprite = list[| infoIndex].itemSprite
		draw_sprite_ext(sprite, 0, 492 * view_wport[0]/640, 137 * view_hport[0]/360, 2 * view_wport[0]/640, 2 * view_hport[0]/360, 0, c_white, 1);
		
		draw_text_transformed(460 * view_wport[0]/640, 190 * view_hport[0]/360, string(list[| infoIndex].healthEffect), view_wport[0]/640, view_hport[0]/360, 0);
		
		draw_text_transformed(460 * view_wport[0]/640, 203 * view_hport[0]/360, string(list[| infoIndex].armorEffect), view_wport[0]/640, view_hport[0]/360, 0);
		
		draw_text_transformed(460 * view_wport[0]/640, 216 * view_hport[0]/360, string(list[| infoIndex].shieldEffect), view_wport[0]/640, view_hport[0]/360, 0);
		
		draw_text_transformed(460 * view_wport[0]/640, 229 * view_hport[0]/360, string(list[| infoIndex].movementSpeedEffect), view_wport[0]/640, view_hport[0]/360, 0);
		
		draw_text_transformed(507 * view_wport[0]/640, 190 * view_hport[0]/360, string(list[| infoIndex].dodgeSpeedEffect), view_wport[0]/640, view_hport[0]/360, 0);
		
		draw_text_transformed(507 * view_wport[0]/640, 203 * view_hport[0]/360, string(list[| infoIndex].dodgechargeEffect), view_wport[0]/640, view_hport[0]/360, 0);
		
		draw_text_transformed(507 * view_wport[0]/640, 216 * view_hport[0]/360, string(list[| infoIndex].weaponAttackMultEffect), view_wport[0]/640, view_hport[0]/360, 0);
		
		draw_text_transformed(507 * view_wport[0]/640, 229 * view_hport[0]/360, string(list[| infoIndex].weaponFirerateEffect), view_wport[0]/640, view_hport[0]/360, 0);
		
		draw_text_ext_transformed(445 * view_wport[0]/640, 245 * view_hport[0]/360, string(list[| infoIndex].description), 8, 184, (view_wport[0]/640)/2, (view_hport[0]/360)/2, 0);
	}
}