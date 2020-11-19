/// @description Insert description here
// You can write your code in this editor

var closestInstance = 0

switch (obj_player.currentWeapon.targetMode)
{
	case targetModes.enemies:
		closestInstance = instance_nearest(mouse_x, mouse_y, obj_defaultEnemyParams)
		break;
	case targetModes.enemiesAndObstacles:
		closestInstance = get_closest_enemy_or_obstacle(mouse_x, mouse_y)
		break;
	case targetModes.enemiesObstaclesAndDestroyableWeapons:
		closestInstance = get_closest_enemy_obstacle_or_destroyableWeapon(mouse_x, mouse_y)
		break;
	default:
		closestInstance = instance_nearest(mouse_x, mouse_y, obj_defaultEnemyParams)
		break;
}

if closestInstance != noone
{
	var distanceToClosestInstance = point_distance(mouse_x, mouse_y, closestInstance.x, closestInstance.y)
}

if closestInstance != noone && distanceToClosestInstance <= 60 && !lockOn
{
	x = closestInstance.x
	y = closestInstance.y
	
	currentTargetedInstance = closestInstance;
	
	visible = enabled && !obj_drawUI.menuOpen;
	if obj_player.weaponIndex == 3
	{
		if mouse_check_button_pressed(mb_left)
		{
			lockOn = true;
			lockOnInstance = closestInstance
		}
	}
	else
	{
		if mouse_check_button_released(mb_right)
		{
			lockOn = true;
			lockOnInstance = closestInstance
		}
	}
}
else if lockOn
{
	if instance_exists(lockOnInstance)
	{
		x = lockOnInstance.x
		y = lockOnInstance.y
		visible = enabled && !obj_drawUI.menuOpen;
		if obj_player.weaponIndex == 3
		{
			if mouse_check_button_released(mb_left)
			{
				lockOn = false;
				lockOnInstance = noone
			}
		}
		else
		{
			if mouse_check_button_released(mb_right)
			{
				lockOn = false;
				lockOnInstance = noone
			}
		}
	}
	else
	{
		lockOn = false;
		lockOnInstance = noone	
	}
}
else
{
	currentTargetedInstance = noone;
	visible = false;
	x = mouse_x
	y = mouse_y
}

image_angle += 5