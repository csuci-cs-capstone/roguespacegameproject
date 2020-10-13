/// @description Insert description here
// You can write your code in this editor

if (obj_player.dodging)
{
	visible = 0;
}
else
{
	visible = 1;
	
	if charged
	{
		if side == 0
		{
			if mouse_check_button(mb_right)
			{
				charged = false;
				alarm_set(0, room_speed * 0.125);
				var proj = instance_create_layer(x, y, "Interactible", obj_player.equipped[? "rightWeaponSlot"].projectile)
				proj.damage = 5;
				image_index = 1;
				image_speed = 1;
			}
		}
		else if side == 1
		{
			if mouse_check_button(mb_left)
			{
				charged = false;
				alarm_set(0, room_speed * 0.125);
				var proj = instance_create_layer(x, y, "Interactible", obj_player.equipped[? "leftWeaponSlot"].projectile)
				proj.damage = 5;
				image_index = 1;
				image_speed = 1;
			}
		}
	}
}