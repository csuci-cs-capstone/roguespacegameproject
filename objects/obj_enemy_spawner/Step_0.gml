/// @description Insert description here
// You can write your code in this editor

if (instance_number(obj_defaultEnemyParams) < 1)
{
	instance_create_layer(random_range(300, room_width - 300), random_range(300, room_height - 300), "Interactible", obj_basicShip);
}