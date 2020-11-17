/// @description Insert description here
// You can write your code in this editor


if currentHealth <= 0
{
	instance_destroy()	
}

if !alarm_has_set && instance_exists(obj_player) && !obj_player.dodging && distance_to_object(obj_player) < 45
{
	alarm_set(0, room_speed)
	alarm_has_set = true
}

if alarm_has_set
{
	image_speed = ((room_speed) - alarm_get(0))/(room_speed)
}