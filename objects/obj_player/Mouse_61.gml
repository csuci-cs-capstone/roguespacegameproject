/// @description Insert description here
// You can write your code in this editor

if !obj_drawUI.menuOpen
{
	weaponIndex -= 1

	if weaponIndex < 0
	{
		weaponIndex = 3	
	}

	moveDirection = false;

	event_user(0)
}