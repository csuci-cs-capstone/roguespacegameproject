/// @description Insert description here
// You can write your code in this editor

if instance_exists(obj_Boss)
{
	if obj_Boss.attackPattern == bossAttackPatterns.moveTowardsCenterAndFireRapid && obj_Boss.state == behaviorStates.attack
	{
		event_user(0)
	}
}