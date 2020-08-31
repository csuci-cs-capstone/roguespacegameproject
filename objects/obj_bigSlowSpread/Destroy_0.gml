/// @description Insert description here
// You can write your code in this editor

var weaponInstance = instance_create_layer(x, y, "Interactible", obj_bigSlowSpreadProj)

with (weaponInstance)
{
	direction = other.direction + 4;
}

weaponInstance = instance_create_layer(x, y, "Interactible", obj_bigSlowSpreadProj)

with (weaponInstance)
{
	direction = other.direction + 2;
}

weaponInstance = instance_create_layer(x, y, "Interactible", obj_bigSlowSpreadProj)

with (weaponInstance)
{
	direction = other.direction;
}

weaponInstance = instance_create_layer(x, y, "Interactible", obj_bigSlowSpreadProj)

with (weaponInstance)
{
	direction = other.direction - 2;
}

weaponInstance = instance_create_layer(x, y, "Interactible", obj_bigSlowSpreadProj)

with (weaponInstance)
{
	direction = other.direction - 4;
}