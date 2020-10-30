/// @description Insert description here
// You can write your code in this editor

var totalKineticEnergy = phy_mass * power(speedChange, 2) * 0.5 + other.phy_mass * power(other.speedChange, 2) * 0.5;

currentHealth -= totalKineticEnergy/2

if other.currentShields >= 0
{
	other.currentShields -= totalKineticEnergy/2;
	other.shieldAlpha = 1;
}
else
{
	other.currentHealth -= totalKineticEnergy/2;
}