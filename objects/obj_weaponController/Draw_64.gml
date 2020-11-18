/// @description Insert description here
// You can write your code in this editor

if weaponIndex == 2 && charged[weaponIndex] && mouse_check_button(mb_left)
{
	draw_sprite_part(spr_chargeBar, 0, 0, 0, (((room_speed * get_stat("chargeTimeStat")) - alarm_get(4))/(room_speed * get_stat("chargeTimeStat"))) * 48, 3, 10, 348)
}
else
{
	draw_sprite_part(spr_chargeBar, 0, 0, 0, (alarm_get(weaponIndex)/(room_speed * 1/(get_stat("firerateStat")))) * 48, 3, 10, 348)
}