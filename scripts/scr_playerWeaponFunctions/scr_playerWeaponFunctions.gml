// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information


function get_closest_enemy_or_obstacle(_x, _y)
{
	var dist1 = distance_to_object(obj_defaultEnemyParams)
	var dist2 = distance_to_object(obj_obstacleParent)
	
	if dist1 <= dist2
	{
		return instance_nearest(_x, _y, obj_defaultEnemyParams)
	}
	else
	{
		return instance_nearest(_x, _y, obj_obstacleParent)	
	}
}

function get_closest_enemy_obstacle_or_destroyableWeapon(_x, _y)
{
	var object1 = get_closest_enemy_or_obstacle(_x, _y)
	var dist1 = distance_to_object(object1)
	var dist2 = distance_to_object(obj_destroyableWeapon)
	
	if dist1 <= dist2
	{
		return object1
	}
	else
	{
		return instance_nearest(_x, _y, obj_destroyableWeapon)	
	}
}