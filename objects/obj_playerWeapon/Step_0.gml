/// @description Insert description here
// You can write your code in this editor

if (obj_player.dodging)
{
	visible = 0;
}
else
{
	visible = 1;
	
	fireKey = mouse_check_button(mb_left);
	
	if charged & (obj_player.side = side)
	{
		if fireKey
		{
			charged = false;
			alarm_set(0, room_speed * 0.125);
			var proj = instance_create_layer(x, y, "Interactible", obj_simpleProjectile)
			proj.damage = 5;
			image_index = 1;
			image_speed = 1;
		}
	}
}