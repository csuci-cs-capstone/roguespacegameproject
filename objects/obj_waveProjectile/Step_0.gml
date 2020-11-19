/// @description Insert description here
// You can write your code in this editor

if instance_exists(obj_player)
{
	image_alpha = alarm_get(0)/((room_speed * get_stat("pulseLifetimeStat"))/8)

	collision_line_list(x + lengthdir_x(43, -phy_rotation - 90), y + lengthdir_y(43, -phy_rotation - 90), x + lengthdir_x(43, -phy_rotation + 90), y + lengthdir_y(43, -phy_rotation + 90), obj_defaultEnemyParams, false, true, listOfCollisions, false)
	collision_line_list(x + lengthdir_x(43, -phy_rotation - 90), y + lengthdir_y(43, -phy_rotation - 90), x + lengthdir_x(43, -phy_rotation + 90), y + lengthdir_y(43, -phy_rotation + 90), obj_destroyableWeapon, false, true, listOfCollisions, false)
	collision_line_list(x + lengthdir_x(43, -phy_rotation - 90), y + lengthdir_y(43, -phy_rotation - 90), x + lengthdir_x(43, -phy_rotation + 90), y + lengthdir_y(43, -phy_rotation + 90), obj_obstacleParent, false, true, listOfCollisions, false)

	for (var i = 0; i < ds_list_size(listOfCollisions); i++)
	{
		var touchingObject = listOfCollisions[| i]
		
		if instance_exists(touchingObject) && ds_list_find_index(collisionBlacklist, touchingObject) == -1
		{
			ds_list_insert(collisionBlacklist, 0, touchingObject);
			with(touchingObject)
			{
				physics_apply_impulse(x, y, lengthdir_x(300, point_direction(obj_player.x, obj_player.y, x, y)), lengthdir_y(300, point_direction(obj_player.x, obj_player.y, x, y)))
			}
			if object_is_ancestor(touchingObject.object_index, obj_defaultEnemyParams) || object_is_ancestor(touchingObject.object_index, obj_destroyableWeapon)
			{
				touchingObject.currentHealth -= damage;
				with (touchingObject)
				{
					audio_stop_sound(snd_hit2)
					audio_play_sound(snd_hit2, 0, false);
					flash = 2
				}
			}
		}
		else
		{
			ds_list_delete(listOfCollisions, i)
		}
	}
}