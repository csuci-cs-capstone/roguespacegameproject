/// @description Collision Damage
// You can write your code in this editor

// Inherit the parent event
event_inherited();

if currentShields >= 0
{
	shieldAlpha = 1;
	currentShields -= phy_mass * power(speedChange, 2) * 0.5
}
else
{
	currentHealth -= phy_mass * power(speedChange, 2) * 0.5
}