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
	
	draw_text_transformed(298, 56, string(obj_player.money), 2, 2, 0)
	
	draw_text_transformed(390, 56, string(obj_player.missiles), 2, 2, 0)
	
	draw_text_transformed(482, 56, string(obj_player.currentHealth), 2, 2, 0)
	
	// Map button
	if (point_in_rectangle(mousex, mousey, 91, 39, 145, 75))
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
	
	// INV button
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
	
	if instance_exists(obj_spaceStation)
	{
		// INV button
		if (point_in_rectangle(mousex, mousey, 207, 51, 261, 75))
		{
			draw_sprite(spr_shopButton, 1, 207, 51);
			if mouse_check_button(mb_left)
			{
				draw_sprite(spr_shopButton, 2, 207, 51);
				menuMode = 2;
			}
		}
		else
		{
			draw_sprite(spr_shopButton, 0, 207, 51);
		}
	}
	
	// Draw menu based on menu mode
	if menuMode == 0
	{
		draw_sector_map()
	}
	else if menuMode == 1
	{
		draw_sprite(spr_invMenu, -1, 0, 0);
		draw_inventory(98, 101, 4, 7, obj_player.inventory, true)
		if invHeight + invScroll >= 203
		{
			draw_scrollbar(373, 101)
		}
		draw_equip_menu()
		draw_info(441, 86)
		follow_mouse()
		draw_sell_button();
	}
	else if menuMode == 2
	{
		draw_sprite(spr_shopMenu, -1, 0, 0)
		draw_inventory(108, 91, 4, 4, obj_universe.generatedSectors[? get_coordinates_string()].sectorShopInv, false)
		draw_info(290, 85)
		draw_buy_button();
		draw_repair_buttons();
		draw_missile_buttons();
	}
}



function draw_inventory(originx, originy, spacing, columns, list, draggable)
{
	if !surface_exists(invSurface)
	{
		invSurface = surface_create((35 * columns) + (4 * (columns - 1)), 203);	
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
						fromEquipment = false;
						infoScroll = 0;
						if draggable && point_distance(pressedX, pressedY, surfaceMouseX, surfaceMouseY) > 8
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
		draw_surface_part(invSurface, 0, 0, (35 * columns) + (4 * (columns - 1)), 203, originx, originy);
		surface_free(invSurface)
	}
}

function draw_info(_x, _y)
{
	if point_in_rectangle(mousex, mousey, _x + 2, _y + 100, _x + 98, _y + 155)
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
		draw_sprite_ext(sprite, 0, _x + 51, _y + 51, 2, 2, 0, c_white, 1);
		
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
			draw_surface_part(infoSurface, 0, 0, 96, 55, _x + 2, _y + 100);
			surface_free(infoSurface)
		}
		
		draw_text_ext_transformed(_x + 4, _y + 159, string(infoIndex.description), 8, 184, 0.5, 0.5, 0);
	}
	else
	{
		draw_sprite_ext(spr_player, 0, _x + 51, _y + 51, 3, 3, 90, c_white, 1);
		
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
			draw_surface_part(infoSurface, 0, 0, 96, 55, _x + 2, _y + 100);
			surface_free(infoSurface)
		}
		
		draw_text_ext_transformed(_x + 4, _y + 159, string(obj_player.description), 8, 184, 0.5, 0.5, 0);
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
			draw_sprite(obj_player.equipped[? "basicWeaponSlot"].itemSprite, -1, 413, 122)
			if point_in_rectangle(mousex, mousey, 398, 108, 427, 137)
			{
				if mouse_check_button(mb_left)
				{
					infoIndex = obj_player.equipped[? "basicWeaponSlot"]
					fromEquipment = true;
					infoScroll = 0;
				}
				if mouse_check_button_released(mb_left) && (carriedItemIndex != -1) && carriedItem.weaponType == weaponTypes.basic
				{
					equip_item(carriedItemIndex, "basicWeaponSlot")
				}
			}
		}
		if is_struct(obj_player.equipped[? "missileWeaponSlot"])
		{
			draw_sprite(obj_player.equipped[? "missileWeaponSlot"].itemSprite, -1, 413, 170)
			if point_in_rectangle(mousex, mousey, 398, 156, 427, 185)
			{
				if mouse_check_button(mb_left)
				{
					infoIndex = obj_player.equipped[? "missileWeaponSlot"]
					fromEquipment = true;
					infoScroll = 0;
				}
				if mouse_check_button_released(mb_left) && (carriedItemIndex != -1) && carriedItem.weaponType == weaponTypes.missile
				{
					equip_item(carriedItemIndex, "missileWeaponSlot")
				}
			}
		}
		if is_struct(obj_player.equipped[? "areaWeaponSlot"])
		{
			draw_sprite(obj_player.equipped[? "areaWeaponSlot"].itemSprite, -1, 413, 218)
			if point_in_rectangle(mousex, mousey, 398, 204, 427, 233)
			{
				if mouse_check_button(mb_left)
				{
					infoIndex = obj_player.equipped[? "areaWeaponSlot"]
					fromEquipment = true;
					infoScroll = 0;
				}
				if mouse_check_button_released(mb_left) && (carriedItemIndex != -1) && carriedItem.weaponType == weaponTypes.area
				{
					equip_item(carriedItemIndex, "areaWeaponSlot")
				}
			}
		}
		if is_struct(obj_player.equipped[? "tractorWeaponSlot"])
		{
			draw_sprite(obj_player.equipped[? "tractorWeaponSlot"].itemSprite, -1, 413, 266)
			if point_in_rectangle(mousex, mousey, 398, 252, 427, 281)
			{
				if mouse_check_button(mb_left)
				{
					infoIndex = obj_player.equipped[? "tractorWeaponSlot"]
					fromEquipment = true;
					infoScroll = 0;
				}
				if mouse_check_button_released(mb_left) && (carriedItemIndex != -1) && carriedItem.weaponType == weaponTypes.tractor
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
					fromEquipment = true;
					infoScroll = 0;
				}
				if mouse_check_button_released(mb_left) && (carriedItemIndex != -1) && carriedItem.itemType == itemTypes.hullItem
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
					fromEquipment = true;
					infoScroll = 0;
				}
				if mouse_check_button_released(mb_left) && (carriedItemIndex != -1) && carriedItem.itemType == itemTypes.armorItem
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
					fromEquipment = true;
					infoScroll = 0;
				}
				if mouse_check_button_released(mb_left) && (carriedItemIndex != -1) && carriedItem.itemType == itemTypes.shieldItem
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
					fromEquipment = true;
					infoScroll = 0;
				}
				if mouse_check_button_released(mb_left) && (carriedItemIndex != -1) && carriedItem.itemType == itemTypes.engineItem
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
					fromEquipment = true;
					infoScroll = 0;
				}
				if mouse_check_button_released(mb_left) && (carriedItemIndex != -1) && carriedItem.itemType == itemTypes.specialItem
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

function draw_buy_button()
{
	if is_struct(infoIndex)
	{
		if (point_in_rectangle(mousex, mousey, 292, 284, 387, 300))
		{
			doNotDisable = true;
			
			draw_sprite(spr_buy, 1, 292, 284);
			if mouse_check_button(mb_left) && infoIndex.value <= obj_player.money
			{
				draw_sprite(spr_buy, 2, 292, 284);
				obj_universe.generatedSectors[? get_coordinates_string()].removeItemFromShop(infoIndex)
				add_item(infoIndex)
				
				obj_player.money -= infoIndex.value;
				
				infoIndex = 0
				doNotDisable = false;
			}
		}
		else
		{
			draw_sprite(spr_buy, 0, 292, 284);
		}
		
		if is_struct(infoIndex)
		{
			if infoIndex.value <= obj_player.money
			{
				draw_set_halign(fa_center);
				draw_text_transformed(340, 285, string(infoIndex.value), 2, 2, 0);
				draw_set_halign(fa_left);
			}
			else
			{
				draw_set_halign(fa_center);
				draw_set_color(c_red);
				draw_text_transformed(340, 285, string(infoIndex.value), 2, 2, 0);
				draw_set_color(c_white);
				draw_set_halign(fa_left);
			}
		}
	}
	else
	{
		draw_sprite(spr_buy, 0, 292, 284);
		
		draw_set_halign(fa_center);
		draw_text_transformed(340, 285, "--", 2, 2, 0);
		draw_set_halign(fa_left);
	}
}

function draw_sell_button()
{
	{
	if is_struct(infoIndex) && !fromEquipment
	{
		if (point_in_rectangle(mousex, mousey, 443, 285, 538, 301))
		{
			doNotDisable = true;
			
			draw_sprite(spr_sellButton, 1, 443, 285);
			if mouse_check_button(mb_left)
			{
				draw_sprite(spr_sellButton, 2, 443, 285);
			}
			if mouse_check_button_released(mb_left)
			{
				remove_item(infoIndex)
				obj_universe.generatedSectors[? get_coordinates_string()].addItemToShop(infoIndex)
				obj_player.money += infoIndex.value/2;
				
				infoIndex = 0
				doNotDisable = false;
			}
		}
		else
		{
			draw_sprite(spr_sellButton, 0, 443, 285);
		}
		
		if is_struct(infoIndex)
		{
			draw_set_halign(fa_center);
			draw_text_transformed(491, 285, string(infoIndex.value/2), 2, 2, 0);
			draw_set_halign(fa_left);
		}
	}
	else
	{
		draw_sprite(spr_sellButton, 0, 443, 285);
		
		draw_set_halign(fa_center);
		draw_text_transformed(491, 285, "--", 2, 2, 0);
		draw_set_halign(fa_left);
	}
}
}

function draw_repair_buttons()
{
	if obj_player.currentHealth < get_stat("hullStat")
	{
		var missingHealth = get_stat("hullStat") - obj_player.currentHealth
		
		if (point_in_rectangle(mousex, mousey, 403, 108, 540, 139)) && !(missingHealth < 10 && obj_player.money < missingHealth) && obj_player.money >= 10
		{
			doNotDisable = true;
			
			draw_sprite(spr_repair, 1, 403, 108);
			if mouse_check_button(mb_left)
			{
				draw_sprite(spr_repair, 2, 403, 108);
			}
			if mouse_check_button_pressed(mb_left)
			{
				if missingHealth < 10 && obj_player.money >= missingHealth
				{
					obj_player.money -= round(missingHealth);
					obj_player.currentHealth += missingHealth;
				}
				else if obj_player.money >= 10
				{
					obj_player.money -= 10;
					obj_player.currentHealth += 10;
				}
			}
			if mouse_check_button_released(mb_left)
			{
				doNotDisable = false;
			}
		}
		else
		{
			draw_sprite(spr_repair, 0, 403, 108);
		}
	
		if (point_in_rectangle(mousex, mousey, 403, 142, 540, 173)) && obj_player.money >= missingHealth
		{
			doNotDisable = true;
			
			draw_sprite_ext(spr_repair, 1, 541, 174, 1, 1, 180, c_white, 1);
			if mouse_check_button(mb_left)
			{
				draw_sprite_ext(spr_repair, 2, 541, 174, 1, 1, 180, c_white, 1);
			}
			if mouse_check_button_pressed(mb_left)
			{
				if obj_player.money >= missingHealth
				{
					obj_player.money -= round(missingHealth);
					obj_player.currentHealth += missingHealth;
				}
			}
			if mouse_check_button_released(mb_left)
			{
				doNotDisable = false;
			}
		}
		else
		{
			draw_sprite_ext(spr_repair, 0, 541, 174, 1, 1, 180, c_white, 1);
		}
		
		draw_set_halign(fa_center);
		
		if missingHealth < 10 && missingHealth != 0
		{
			draw_text_transformed(472, 108, "Fix" + string(round(missingHealth)) + "Hull", 2, 2, 0);
			if obj_player.money >= missingHealth
			{
				draw_text_transformed(472, 124, string(round(missingHealth)) + " Scrap", 2, 2, 0);
			}
			else
			{
				draw_set_color(c_red);
				draw_text_transformed(472, 124, string(round(missingHealth)) + " Scrap", 2, 2, 0);
				draw_set_color(c_white);
			}
		}
		else
		{
			draw_text_transformed(472, 108, "Fix 10 Hull", 2, 2, 0);
			
			if obj_player.money >= 10
			{
				draw_text_transformed(472, 124, "10 Scrap", 2, 2, 0);
			}
			else
			{
				draw_set_color(c_red);
				draw_text_transformed(472, 124, "10 Scrap", 2, 2, 0);
				draw_set_color(c_white);
			}
		}
		
		draw_text_transformed(472, 142, "Fix All Hull", 2, 2, 0);
		
		if obj_player.money >= missingHealth
		{
			draw_text_transformed(472, 158, string(round(missingHealth)) + " Scrap", 2, 2, 0);
		}
		else
		{
			draw_set_color(c_red);
			draw_text_transformed(472, 158, string(round(missingHealth)) + " Scrap", 2, 2, 0);
			draw_set_color(c_white);
		}
		
		draw_set_halign(fa_left);
		
	}
	else
	{
		draw_sprite(spr_repair, 0, 403, 108);
		draw_sprite_ext(spr_repair, 0, 541, 174, 1, 1, 180, c_white, 1);
		
		draw_set_halign(fa_center);
		
		draw_text_transformed(472, 116, "Repairs", 2, 2, 0);
		draw_text_transformed(472, 150, "Not Needed", 2, 2, 0);
		
		draw_set_halign(fa_left);
	}
}

function draw_missile_buttons()
{
	if obj_player.money >= 7
	{
		
		if (point_in_rectangle(mousex, mousey, 403, 216, 540, 247))
		{
			doNotDisable = true;
			
			draw_sprite(spr_buyMissile, 1, 403, 216);
			if mouse_check_button(mb_left)
			{
				draw_sprite(spr_buyMissile, 2, 403, 216);
			}
			if mouse_check_button_pressed(mb_left)
			{
				if obj_player.money >= 7
				{
					obj_player.money -= 7;
					obj_player.missiles ++;
				}
			}
			if mouse_check_button_released(mb_left)
			{
				doNotDisable = false;
			}
		}
		else
		{
			draw_sprite(spr_buyMissile, 0, 403, 216);
		}
		
		draw_set_halign(fa_center);
		draw_text_transformed(472, 216, "1 Missile", 2, 2, 0);
		draw_text_transformed(472, 232, "7 Scrap", 2, 2, 0);
		draw_set_halign(fa_left);
	}
	else
	{
		draw_sprite(spr_buyMissile, 0, 403, 216);
		
		draw_set_halign(fa_center);
		draw_text_transformed(472, 216, "1 Missile", 2, 2, 0);
		draw_set_color(c_red);
		draw_text_transformed(472, 232, "7 Scrap", 2, 2, 0);
		draw_set_color(c_white);
		draw_set_halign(fa_left);
	}
	
	if obj_player.money >= 35
	{
		if (point_in_rectangle(mousex, mousey, 403, 250, 540, 281))
		{
			doNotDisable = true;
			
			draw_sprite_ext(spr_buyMissile, 1, 541, 282, 1, 1, 180, c_white, 1);
			if mouse_check_button(mb_left)
			{
				draw_sprite_ext(spr_buyMissile, 2, 541, 282, 1, 1, 180, c_white, 1);
			}
			if mouse_check_button_pressed(mb_left)
			{
				if obj_player.money >= 35
				{
					obj_player.money -= 35;
					obj_player.missiles += 5;
				}
			}
			if mouse_check_button_released(mb_left)
			{
				doNotDisable = false;
			}
		}
		else
		{
			draw_sprite_ext(spr_buyMissile, 0, 541, 282, 1, 1, 180, c_white, 1);
		}
		
		draw_set_halign(fa_center);
		draw_text_transformed(472, 250, "5 Missiles", 2, 2, 0);
		draw_text_transformed(472, 266, "35 Scrap", 2, 2, 0);
		draw_set_halign(fa_left);
	}
	else
	{
		draw_sprite_ext(spr_buyMissile, 0, 541, 282, 1, 1, 180, c_white, 1);
		
		draw_set_halign(fa_center);
		draw_text_transformed(472, 250, "5 Missiles", 2, 2, 0);
		draw_set_color(c_red);
		draw_text_transformed(472, 266, "35 Scrap", 2, 2, 0);
		draw_set_color(c_white);
		draw_set_halign(fa_left);
	}
}