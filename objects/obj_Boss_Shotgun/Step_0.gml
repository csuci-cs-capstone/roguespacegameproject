/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event

if instance_exists(obj_Boss)
{
	if obj_Boss.attackPattern == bossAttackPatterns.quicklyMoveTowardsDestinationAndFireShotguns
	{
		event_user(0)	
	}
}