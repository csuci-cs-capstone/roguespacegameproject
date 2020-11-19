/// @description Insert description here
// You can write your code in this editor

if !obj_drawUI.menuOpen
{
	weaponIndex += 1

	if weaponIndex > 3
	{
		weaponIndex = 0
	}

	moveDirection = true;

	event_user(0)
}