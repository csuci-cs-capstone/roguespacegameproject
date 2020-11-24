/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event

if dying
{
	event_inherited();

	if global.bossLevel == 3
	{
		instance_destroy(innerShellLeft);
		instance_destroy(innerShellRight);
	
		with(outerShellLeft)
		{
			physics_apply_impulse(x, y, lengthdir_x(1000, -other.phy_rotation + 90), lengthdir_y(1000, -other.phy_rotation + 90))	
		}
	
		with(outerShellRight)
		{
			physics_apply_impulse(x, y, lengthdir_x(1000, -other.phy_rotation - 90), lengthdir_y(1000, -other.phy_rotation - 90))	
		}
	}

	if global.bossLevel == 2
	{
		with(innerShellLeft)
		{
			physics_apply_impulse(x, y, lengthdir_x(1000, -other.phy_rotation + 90), lengthdir_y(1000, -other.phy_rotation + 90))	
		}
	
		with(innerShellRight)
		{
			physics_apply_impulse(x, y, lengthdir_x(1000, -other.phy_rotation - 90), lengthdir_y(1000, -other.phy_rotation - 90))	
		}
	}

	global.bossLevel--;
}