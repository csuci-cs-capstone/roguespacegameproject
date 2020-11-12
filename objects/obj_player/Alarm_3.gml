/// @description Insert description here
// You can write your code in this editor
if side
{
	with(leftWeapon)
	{
		event_user(0)
	}
}
else
{
	with(rightWeapon)
	{
		event_user(0)
	}
}

side = !side

alarm_set(3, room_speed * (1 / (get_stat("firerateStat") * 2)));