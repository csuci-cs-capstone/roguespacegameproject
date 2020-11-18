/// @description Insert description here
// You can write your code in this editor

weaponIndex = obj_player.weaponIndex

if canFire && !obj_player.dodging && mouse_check_button(mb_left) && !obj_jumpMechanics.jump
{
	firingMode = obj_player.currentWeapon.firePattern
	
	switch (firingMode)
	{
		case firingPatterns.alternate:
			if charged[weaponIndex]
			{
				if side
				{
					with(obj_player.leftWeapon)
					{
						event_user(0)	
					}
				}
				else
				{
					with(obj_player.rightWeapon)
					{
						event_user(0)
					}	
				}
				side = !side
				alarm_set(weaponIndex, room_speed * 1/(get_stat("firerateStat")))
				charged[weaponIndex] = false;	
			}
		case firingPatterns.unison:
			if charged[weaponIndex]
			{
				with(obj_player.leftWeapon)
				{
					event_user(0)	
				}	
				with(obj_player.rightWeapon)
				{
					event_user(0)
				}
				alarm_set(weaponIndex, room_speed * 1/(get_stat("firerateStat")))
				charged[weaponIndex] = false;	
			}
		case firingPatterns.charge:
			if charged[weaponIndex]
			{
				if !alarmSet
				{
					alarm_set(4, room_speed * get_stat("chargeTimeStat"))
					alarmSet = true;
				}
			}
	}
}

if !canFire || obj_jumpMechanics.jump || weaponIndex != 2
{
	alarmSet = false;
	alarm_set(4, -1);
}

if mouse_check_button_released(mb_left)
{
	if ready
	{
		ready = false;
		
		var proj = instance_create_layer(obj_player.phy_position_x, obj_player.phy_position_y, "Interactible", obj_player.currentWeapon.projectile)
		proj.aimTowards = -obj_player.phy_rotation;
		with(proj)
		{
			event_user(0);	
		}
		
		alarm_set(weaponIndex, room_speed * 1/(get_stat("firerateStat")))
		charged[weaponIndex] = false;
	}
	alarmSet = false;
	alarm_set(4, -1);
}