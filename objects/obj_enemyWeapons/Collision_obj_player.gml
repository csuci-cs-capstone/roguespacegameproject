/// @description Player Damage
// You can write your code in this editor

if other.currentShields >= 0
{
	other.currentShields -= damage;
}
else
{
	other.currentHealth -= damage;
}

instance_destroy();