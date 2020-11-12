/// @description Insert description here
// You can write your code in this editor

if currentHealth <= 0
{
	instance_destroy()	
}

if !alarm_has_set && distance_to_object(obj_player) < 45
{
	alarm_set(0, room_speed*3)
	alarm_has_set = true
}

if alarm_has_set
{
	image_speed = ((room_speed*3) - alarm_get(0))/(room_speed*3)
}