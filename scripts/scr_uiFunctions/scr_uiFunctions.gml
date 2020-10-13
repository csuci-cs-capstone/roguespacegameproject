// @function				draw_radar_blip(_object, _sprite);
// @param {index} _object	Object to track
// @param {index} _sprite	Sprite to represent object in radar

function draw_radar_blip(_object, _sprite)
{
	with (_object)
	{
		draw_sprite(_sprite, -1, 575 + (x / 21.5517241379), 295  + (y / 21.5517241379))
	}
}

// @function	draw_menu();
function draw_menu()
{
	draw_sprite(spr_menu, -1, 0, 0);
	if (point_in_rectangle(mousex, mousey, 91, 41, 145, 75))
	{
		draw_sprite(spr_mapButton, 1, 91, 51);
		if mouse_check_button(mb_left)
		{
			draw_sprite(spr_mapButton, 2, 91, 51);
			menuMode = 0;
		}
	}
	else
	{
		draw_sprite(spr_mapButton, 0, 91, 51);
	}
	if (point_in_rectangle(mousex, mousey, 149, 51, 203, 75))
	{
		draw_sprite(spr_invButton, 1, 149, 51);
		if mouse_check_button(mb_left)
		{
			draw_sprite(spr_invButton, 2, 149, 51);
			menuMode = 1;
		}
	}
	else
	{
		draw_sprite(spr_invButton, 0, 149, 51);
	}
	if menuMode == 0
	{
		
	}
	else
	{
		draw_sprite(spr_invMenu, -1, 0, 0);
		draw_inventory(98, 101, 4, 7, obj_player.inventory)
		draw_equip_menu()
		draw_info()
		follow_mouse()
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
		if i != carriedItemIndex
		{
			curX = ((spriteSize + spacing) * curColumn) + originx;
			curY = ((spriteSize + spacing) * curRow) + originy;
		
			if point_in_rectangle(mousex, mousey, curX, curY, curX + 35, curY + 35)
			{
				draw_sprite(spr_invBox, 1, curX, curY);
				if mouse_check_button_pressed(mb_left)
				{
					pressedX = mousex
					pressedY = mousey
				}
				if mouse_check_button(mb_left) && (carriedItemIndex == -1)
				{
					infoIndex = list[| i];
					if point_distance(pressedX, pressedY, mousex, mousey) > 8
					{
						carriedItemIndex = i;
						carriedItem = list[| i]
					}
				}
			}
			else
			{
				draw_sprite(spr_invBox, 0, curX, curY);
			}
		
			sprite = list[| i].itemSprite
			draw_sprite(sprite, 0, curX + 17, curY + 17);
		
			curColumn++;
			if curColumn >= columns
			{
				curColumn = 0;
				curRow++;
			}
		}
	}
}

function draw_info()
{
	if is_struct(infoIndex)
	{
		var sprite = infoIndex.itemSprite
		draw_sprite_ext(sprite, 0, 492, 137, 2, 2, 0, c_white, 1);
		
		draw_text_ext_transformed(445, 245, string(infoIndex.description), 8, 184, 0.5, 0.5, 0);
	}
	else
	{
		draw_sprite_ext(spr_player, 0, 492, 137, 3, 3, 90, c_white, 1);
		
		draw_text_ext_transformed(445, 245, string(obj_player.description), 8, 184, 0.5, 0.5, 0);
	}
}

function draw_equip_menu()
{
	draw_sprite(spr_equipSection, -1, 0, 0)
	draw_sprite(spr_equipModeSwitch, equipMode, 355, 86)
	if (point_in_rectangle(mousex, mousey, 355, 86, 383, 96))
	{
		if mouse_check_button_released(mb_left)
		{
			equipMode = not equipMode;
		}
	}
	if equipMode
	{
		if is_struct(obj_player.equipped[? "leftWeaponSlot"])
		{
			draw_sprite(obj_player.equipped[? "leftWeaponSlot"].itemSprite, -1, 413, 121)
			if point_in_rectangle(mousex, mousey, 396, 105, 429, 138)
			{
				if mouse_check_button(mb_left)
				{
					infoIndex = obj_player.equipped[? "leftWeaponSlot"]
				}
				if mouse_check_button_released(mb_left) && (carriedItemIndex != -1)
				{
					equip_item(carriedItemIndex, "leftWeaponSlot")
				}
			}
		}
		if is_struct(obj_player.equipped[? "rightWeaponSlot"])
		{
			draw_sprite(obj_player.equipped[? "rightWeaponSlot"].itemSprite, -1, 413, 163)
			if point_in_rectangle(mousex, mousey, 396, 147, 429, 180)
			{
				if mouse_check_button(mb_left)
				{
					infoIndex = obj_player.equipped[? "rightWeaponSlot"]
				}
				if mouse_check_button_released(mb_left) && (carriedItemIndex != -1)
				{
					equip_item(carriedItemIndex, "rightWeaponSlot")
				}
			}
		}
		if is_struct(obj_player.equipped[? "altLeftWeaonSlot"])
		{
			draw_sprite(obj_player.equipped[? "altLeftWeaonSlot"].itemSprite, -1, 413, 226)
			if point_in_rectangle(mousex, mousey, 396, 209, 429, 242)
			{
				if mouse_check_button(mb_left)
				{
					infoIndex = obj_player.equipped[? "altLeftWeaonSlot"]
				}
				if mouse_check_button_released(mb_left) && (carriedItemIndex != -1)
				{
					equip_item(carriedItemIndex, "altLeftWeaonSlot")
				}
			}
		}
		if is_struct(obj_player.equipped[? "altRightWeaponSlot"])
		{
			draw_sprite(obj_player.equipped[? "altRightWeaponSlot"].itemSprite, -1, 413, 268)
			if point_in_rectangle(mousex, mousey, 396, 251, 429, 284)
			{
				if mouse_check_button(mb_left)
				{
					infoIndex = obj_player.equipped[? "altRightWeaponSlot"]
				}
				if mouse_check_button_released(mb_left) && (carriedItemIndex != -1)
				{
					equip_item(carriedItemIndex, "altRightWeaponSlot")
				}
			}
		}
		draw_sprite(spr_weaponEquip, -1, 0, 0)
	}
	else
	{
		if is_struct(obj_player.equipped[? "hullSlot"])
		{
			draw_sprite(obj_player.equipped[? "hullSlot"].itemSprite, -1, 413, 110)
			if point_in_rectangle(mousex, mousey, 394, 92, 431, 129)
			{
				if mouse_check_button(mb_left)
				{
					infoIndex = obj_player.equipped[? "hullSlot"]
				}
				if mouse_check_button_released(mb_left) && (carriedItemIndex != -1)
				{
					equip_item(carriedItemIndex, "hullSlot")
				}
			}
		}
		if is_struct(obj_player.equipped[? "armorSlot"])
		{
			draw_sprite(obj_player.equipped[? "armorSlot"].itemSprite, -1, 413, 152)
			if point_in_rectangle(mousex, mousey, 394, 134, 431, 171)
			{
				if mouse_check_button(mb_left)
				{
					infoIndex = obj_player.equipped[? "armorSlot"]
				}
				if mouse_check_button_released(mb_left) && (carriedItemIndex != -1)
				{
					equip_item(carriedItemIndex, "armorSlot")
				}
			}
		}
		if is_struct(obj_player.equipped[? "shieldSlot"])
		{
			draw_sprite(obj_player.equipped[? "shieldSlot"].itemSprite, -1, 413, 194)
			if point_in_rectangle(mousex, mousey, 394, 175, 431, 212)
			{
				if mouse_check_button(mb_left)
				{
					infoIndex = obj_player.equipped[? "shieldSlot"]
				}
				if mouse_check_button_released(mb_left) && (carriedItemIndex != -1)
				{
					equip_item(carriedItemIndex, "shieldSlot")
				}
			}
		}
		if is_struct(obj_player.equipped[? "engineSlot"])
		{
			draw_sprite(obj_player.equipped[? "engineSlot"].itemSprite, -1, 413, 236)
			if point_in_rectangle(mousex, mousey, 394, 217, 431, 254)
			{
				if mouse_check_button(mb_left)
				{
					infoIndex = obj_player.equipped[? "engineSlot"]
				}
				if mouse_check_button_released(mb_left) && (carriedItemIndex != -1)
				{
					equip_item(carriedItemIndex, "engineSlot")
				}
			}
		}
		if is_struct(obj_player.equipped[? "specialSlot"])
		{
			draw_sprite(obj_player.equipped[? "specialSlot"].itemSprite, -1, 413, 278)
			if point_in_rectangle(mousex, mousey, 394, 259, 431, 296)
			{
				if mouse_check_button(mb_left)
				{
					infoIndex = obj_player.equipped[? "specialSlot"]
				}
				if mouse_check_button_released(mb_left) && (carriedItemIndex != -1)
				{
					equip_item(carriedItemIndex, "specialSlot")
				}
			}
		}
		draw_sprite(spr_itemEquip, -1, 0, 0)	
	}
}

function follow_mouse()
{
	if is_struct(carriedItem)
	{
		draw_sprite(carriedItem.itemSprite, -1, mousex, mousey)	
		if mouse_check_button_released(mb_left)
		{
			carriedItemIndex = -1
			carriedItem = 0
		}
	}
}