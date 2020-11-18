/// @description Insert description here
// You can write your code in this editor

if canFire && !obj_player.dodging && mouse_check_button(mb_left) && !obj_jumpMechanics.jump
{
	firingMode = obj_player.currentWeapon.firePattern

	switch (firingMode)
	{
		case firingPatterns.alternate:
			if charged
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
				alarm_set(0, room_speed * 1/(get_stat("firerateStat")))
				charged = false;	
			}
		case firingPatterns.unison:
			if charged
			{
				with(obj_player.leftWeapon)
				{
					event_user(0)	
				}	
				with(obj_player.rightWeapon)
				{
					event_user(0)
				}
				alarm_set(0, room_speed * 1/(get_stat("firerateStat")))
				charged = false;	
			}
	}
}