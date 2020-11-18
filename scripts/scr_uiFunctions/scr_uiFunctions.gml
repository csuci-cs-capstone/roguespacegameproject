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
		draw_sector_map()
	}
	else
	{
		draw_sprite(spr_invMenu, -1, 0, 0);
		draw_inventory(98, 101, 4, 7, obj_player.inventory)
		if invHeight + invScroll >= 203
		{
			draw_scrollbar(373, 101)
		}
		draw_equip_menu()
		draw_info()
		follow_mouse()
	}
}


function draw_inventory(originx, originy, spacing, columns, list)
{
	if !surface_exists(invSurface)
	{
		invSurface = surface_create(269, 203);	
	}
	surface_set_target(invSurface);
	draw_clear_alpha(c_white, 0);
	var i, sprite, curRow, curColumn, curX, curY;
	curY = 0;
	var surfaceMouseX = mousex - originx;
	var surfaceMouseY = mousey - originy;
	curRow = 0;
	curColumn = 0;
	var spriteSize = sprite_get_width(spr_invBox);
	if point_in_rectangle(mousex, mousey, originx, originy, originx + 258, originy + 203)
	{
		if mouse_wheel_up()
		{
			if invScroll > 0
			{
				invScroll -= 4;	
			}
		}
		else if mouse_wheel_down()
		{
			if invHeight > 203
			{
				if invHeight - 203 >= 4
				{
					invScroll += 4;
				}
				else
				{
					invScroll += invHeight - 203;
				}
			}
		}
	}
	for (i = 0; i < ds_list_size(list); i++)
	{		
		if i != carriedItemIndex
		{
			curX = (spriteSize + spacing) * curColumn;
			curY = ((spriteSize + spacing) * curRow) - invScroll;
			
			if curY >= -35 && curY <= 238
			{
				if point_in_rectangle(surfaceMouseX, surfaceMouseY, curX, curY, curX + 35, curY + 35)
				{
					draw_sprite(spr_invBox, 1, curX, curY);
					if mouse_check_button_pressed(mb_left)
					{
						pressedX = surfaceMouseX
						pressedY = surfaceMouseY
					}
					if mouse_check_button(mb_left) && (carriedItemIndex == -1)
					{
						infoIndex = list[| i];
						infoScroll = 0;
						if point_distance(pressedX, pressedY, surfaceMouseX, surfaceMouseY) > 8
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
			}
			
			curColumn++;
			if curColumn >= columns
			{
				curColumn = 0;
				curRow++;
			}
		}
	}
	invHeight = curY + 35;
	surface_reset_target();
	if surface_exists(invSurface)
	{
		draw_surface_part(invSurface, 0, 0, 269, 203, originx, originy);
		surface_free(invSurface)
	}
}

function draw_info()
{
	if point_in_rectangle(mousex, mousey, 443, 186, 443 + 96, 186 + 55)
	{
		if mouse_wheel_up()
		{
			if infoScroll > 0
			{
				infoScroll -= 4;	
			}
		}
		else if mouse_wheel_down()
		{
			if infoHeight > 55
			{
				infoScroll += 4;
			}
		}
	}
	
	if is_struct(infoIndex)
	{
		var sprite = infoIndex.itemSprite
		draw_sprite_ext(sprite, 0, 492, 137, 2, 2, 0, c_white, 1);
		
		if !surface_exists(infoSurface)
		{
			infoSurface = surface_create(96, 55)	
		}
		
		surface_set_target(infoSurface);
		
		draw_clear_alpha(c_white, 0);
		
		var stats = infoIndex.effects;
		
		var curY = 2;
		
		curY -= infoScroll;
		
		for (var i = 0; i < array_length(stats); i++)
		{
			switch(stats[i].stat)
			{
				case "hullStat":
					draw_sprite(spr_icons, 0, 1, curY);
					break;
				case "armorStat":
					draw_sprite(spr_icons, 1, 1, curY);
					break;
				case "shieldStat":
					draw_sprite(spr_icons, 2, 1, curY);
					break;
				case "engineStat":
					draw_sprite(spr_icons, 3, 1, curY);
					break;
				case "dodgeSpeedMultStat":
					draw_sprite(spr_icons, 4, 1, curY);
					break;
				case "dodgeRechargeStat":
					draw_sprite(spr_icons, 5, 1, curY);
					break;
				case "damageStat":
					draw_sprite(spr_icons, 6, 1, curY);
					break;
				case "projectileSpeedStat":
					draw_sprite(spr_icons, 6, 1, curY);
					break;
				case "projectileWeightStat":
					draw_sprite(spr_icons, 6, 1, curY);
					break;
				case "firerateStat":
					draw_sprite(spr_icons, 7, 1, curY);
					break;
				default:
			}
			
			draw_text(17, curY + 2, string(stats[i].effectValue))
			
			curY += 13;
		}
		
		infoHeight = curY;
		
		surface_reset_target();
		
		if surface_exists(infoSurface)
		{
			draw_surface_part(infoSurface, 0, 0, 96, 55, 443, 186);
			surface_free(infoSurface)
		}
		
		draw_text_ext_transformed(445, 245, string(infoIndex.description), 8, 184, 0.5, 0.5, 0);
	}
	else
	{
		draw_sprite_ext(spr_player, 0, 492, 137, 3, 3, 90, c_white, 1);
		
		if !surface_exists(infoSurface)
		{
			infoSurface = surface_create(96, 55)	
		}
		
		surface_set_target(infoSurface);
		
		draw_clear_alpha(c_white, 0);
		
		var stats = obj_player.stats;
		
		var curY = 2;
		
		curY -= infoScroll;
		
		draw_sprite(spr_icons, 0, 1, curY);
		
		draw_text(17, curY + 2, string(stats[? "hullStat"]))
		curY += 13;

		draw_sprite(spr_icons, 1, 1, curY);
		
		draw_text(17, curY + 2, string(stats[? "armorStat"]))
		curY += 13;

		draw_sprite(spr_icons, 2, 1, curY);
		
		draw_text(17, curY + 2, string(stats[? "shieldStat"]))
		curY += 13;

		draw_sprite(spr_icons, 3, 1, curY);
		
		draw_text(17, curY + 2, string(stats[? "engineStat"]))
		curY += 13;

		draw_sprite(spr_icons, 4, 1, curY);

		draw_text(17, curY + 2, string(stats[? "dodgeSpeedMultStat"]))
		curY += 13;
		
		draw_sprite(spr_icons, 5, 1, curY);
		
		draw_text(17, curY + 2, string(stats[? "dodgeRechargeStat"]))
		curY += 13;

		draw_sprite(spr_icons, 6, 1, curY);
		
		draw_text(17, curY + 2, string(stats[? "damageStat"]))
		curY += 13;

		draw_sprite(spr_icons, 6, 1, curY);

		draw_text(17, curY + 2, string(stats[? "projectileSpeedStat"]))
		curY += 13;
		
		draw_sprite(spr_icons, 6, 1, curY);
		
		draw_text(17, curY + 2, string(stats[? "projectileWeightStat"]))
		curY += 13;
		
		draw_sprite(spr_icons, 7, 1, curY);
		
		draw_text(17, curY + 2, string(stats[? "firerateStat"]))
		
		infoHeight = curY + 13;
		
		surface_reset_target();
		
		if surface_exists(infoSurface)
		{
			draw_surface_part(infoSurface, 0, 0, 96, 55, 443, 186);
			surface_free(infoSurface)
		}
		
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
		if is_struct(obj_player.equipped[? "basicWeaponSlot"])
		{
			draw_sprite(obj_player.equipped[? "basicWeaponSlot"].itemSprite, -1, 413, 121)
			if point_in_rectangle(mousex, mousey, 396, 105, 429, 138)
			{
				if mouse_check_button(mb_left)
				{
					infoIndex = obj_player.equipped[? "basicWeaponSlot"]
					infoScroll = 0;
				}
				if mouse_check_button_released(mb_left) && (carriedItemIndex != -1)
				{
					equip_item(carriedItemIndex, "basicWeaponSlot")
				}
			}
		}
		if is_struct(obj_player.equipped[? "missileWeaponSlot"])
		{
			draw_sprite(obj_player.equipped[? "missileWeaponSlot"].itemSprite, -1, 413, 163)
			if point_in_rectangle(mousex, mousey, 396, 147, 429, 180)
			{
				if mouse_check_button(mb_left)
				{
					infoIndex = obj_player.equipped[? "missileWeaponSlot"]
					infoScroll = 0;
				}
				if mouse_check_button_released(mb_left) && (carriedItemIndex != -1)
				{
					equip_item(carriedItemIndex, "missileWeaponSlot")
				}
			}
		}
		if is_struct(obj_player.equipped[? "areaWeaponSlot"])
		{
			draw_sprite(obj_player.equipped[? "areaWeaponSlot"].itemSprite, -1, 413, 226)
			if point_in_rectangle(mousex, mousey, 396, 209, 429, 242)
			{
				if mouse_check_button(mb_left)
				{
					infoIndex = obj_player.equipped[? "areaWeaponSlot"]
					infoScroll = 0;
				}
				if mouse_check_button_released(mb_left) && (carriedItemIndex != -1)
				{
					equip_item(carriedItemIndex, "areaWeaponSlot")
				}
			}
		}
		if is_struct(obj_player.equipped[? "tractorWeaponSlot"])
		{
			draw_sprite(obj_player.equipped[? "tractorWeaponSlot"].itemSprite, -1, 413, 268)
			if point_in_rectangle(mousex, mousey, 396, 251, 429, 284)
			{
				if mouse_check_button(mb_left)
				{
					infoIndex = obj_player.equipped[? "tractorWeaponSlot"]
					infoScroll = 0;
				}
				if mouse_check_button_released(mb_left) && (carriedItemIndex != -1)
				{
					equip_item(carriedItemIndex, "tractorWeaponSlot")
				}
			}
		}
		draw_sprite(spr_weaponEquip2, -1, 0, 0)
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
					infoScroll = 0;
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
					infoScroll = 0;
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
					infoScroll = 0;
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
					infoScroll = 0;
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
					infoScroll = 0;
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

function draw_scrollbar(originX, originY)
{
	draw_sprite(spr_scrollBar, 0, originX, originY);
	draw_sprite(spr_scrollNub, 0, originX + 3, ((invScroll / ((invHeight + invScroll) - 203)) * 179) + 104)
	draw_text(16, 32, string(invScroll))
	draw_text(16, 48, string((invHeight + invScroll) - 203))
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

function draw_jump_menu()
{
	var mouseDirection = point_direction(320, 180, mousex, mousey);
	
	if mouseDirection > 45 && mouseDirection < 135
	{
		draw_sprite_ext(spr_jumpbutton, 1, 320, 180 - 80, 1, 1, 0, c_white, 1);
		jumpDirection = 90
	}
	else
	{
		draw_sprite_ext(spr_jumpbutton, 0, 320, 180 - 70, 1, 1, 0, c_white, 1);
	}
		
	if mouseDirection > 315 || mouseDirection < 45
	{
		draw_sprite_ext(spr_jumpbutton, 1, 320 + 80, 180, 1, 1, 270, c_white, 1);
		jumpDirection = 0
	}
	else
	{
		draw_sprite_ext(spr_jumpbutton, 0, 320 + 70, 180, 1, 1, 270, c_white, 1);
	}
		
	if mouseDirection > 225 && mouseDirection < 315
	{
		draw_sprite_ext(spr_jumpbutton, 1, 320, 180 + 80, 1, 1, 180, c_white, 1);
		jumpDirection = 270
	}
	else
	{
		draw_sprite_ext(spr_jumpbutton, 0, 320, 180 + 70, 1, 1, 180, c_white, 1);
	}
		
	if mouseDirection > 135 && mouseDirection < 225
	{
		draw_sprite_ext(spr_jumpbutton, 1, 320 - 80, 180, 1, 1, 90, c_white, 1);
		jumpDirection = 180
	}
	else
	{
		draw_sprite_ext(spr_jumpbutton, 0, 320 - 70, 180, 1, 1, 90, c_white, 1);
	}	
}

function draw_sector_map()
{
	if !surface_exists(invSurface)
	{
		invSurface = surface_create(458, 230);	
	}
	surface_set_target(invSurface);
	draw_clear_alpha(c_black, 1);
	
	var boxX, boxY, colorVal, currentSector
	var sectors = obj_universe.generatedSectors;
	var visitedSectors = obj_universe.visitedSectors;
	for (var i = 0; i < ds_list_size(visitedSectors); i++)
	{
		currentSector = sectors[? visitedSectors[| i]]
		boxX = ((currentSector.sectorX - obj_universe.playerSectorX) * 32) + 229
		boxY = -((currentSector.sectorY - obj_universe.playerSectorY) * 32) + 115
		colorVal = 255 - clamp((currentSector.sectorDanger / 50) * 255, 0, 255)
		if currentSector.sectorHasShop
		{
			draw_sprite_ext(spr_sectorSquare, 0, boxX, boxY, 1, 1, 0, make_color_rgb(255, 255, 255), 1)
		}
		else
		{
			draw_sprite_ext(spr_sectorSquare, 0, boxX, boxY, 1, 1, 0, make_color_rgb(255, colorVal, colorVal), 1)
		}
	}
	
	for (var i = ds_map_find_first(sectors); !is_undefined(i); i = ds_map_find_next(sectors, i))
	{
		if sectors[? i].sectorHasShop
		{
			boxX = ((sectors[? i].sectorX - obj_universe.playerSectorX) * 32) + 229
			boxY = -((sectors[? i].sectorY - obj_universe.playerSectorY) * 32) + 115
			
			draw_sprite_ext(spr_sectorShopSquare, 0, boxX, boxY, 1, 1, 0, make_color_rgb(255, 255, 0), 1)
		}
	}
	
	draw_sprite_ext(spr_sectorBorder, 0, 229, 115, 1, 1, 0, c_white, 1)
	
	surface_reset_target();
	if surface_exists(invSurface)
	{
		draw_surface_part(invSurface, 0, 0, 458, 230, 92, 80);
		surface_free(invSurface)
	}
}