/// @description Insert description here
// You can write your code in this editor

weaponIndex = obj_player.weaponIndex

obj_target.enabled = (obj_player.currentWeapon.targetMode != targetModes.doesNotTarget) && !(weaponIndex == 3 && mouse_check_button(mb_left))

if (canFire && !obj_player.dodging && mouse_check_button(mb_left) && !obj_jumpMechanics.jump) && !(weaponIndex == 1 && obj_player.missiles <= 0)
{
	firingMode = obj_player.currentWeapon.firePattern
	
	if weaponIndex == 1 && charged[1]
	{
		obj_player.missiles--;	
	}
	
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
				//alarm_set(weaponIndex, room_speed * (1/(get_stat("firerateStat"))))
				alarm_set(weaponIndex, room_speed * (1/(get_stat("firerateStat"))))
				charged[weaponIndex] = false;	
			}
			break;
		case firingPatterns.burstAlternate:
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
			break;
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
			break;
		case firingPatterns.burstUnison:
			break;
		case firingPatterns.charge:
			if charged[weaponIndex]
			{
				if !alarmSet
				{
					alarm_set(4, room_speed * get_stat("chargeTimeStat"))
					alarmSet = true;
				}
			}
			break;
		case firingPatterns.burstCharge:
			break;
		case firingPatterns.stream:
			event_user(0)
			break;
		case firingPatterns.swarm:
			break;
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
	
	if connection
	{
		physics_joint_delete(connection)
		connectedInstance = noone;
		jointCreated = false;
		connection = 0
	}
	
	alarmSet = false;
	alarm_set(4, -1);
}

if !instance_exists(obj_target.currentTargetedInstance)
{
	physics_joint_delete(connection)
	connectedInstance = noone;
	jointCreated = false;
	connection = 0
}