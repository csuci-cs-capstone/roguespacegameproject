/// @description Insert description here
// You can write your code in this editor

distanceFromInitial = point_distance(x, y, initialX, initialY)

if index < 4
{
	index += 0.1;	
}

if !canDestroy && instance_exists(obj_player) && !obj_player.dodging && distance_to_object(obj_player) <= 1.5
{
	event_user(0)
}

if canDestroy && index >= 4
{
	instance_destroy();	
}