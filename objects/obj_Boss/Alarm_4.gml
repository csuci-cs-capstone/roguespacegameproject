/// @description Insert description here
// You can write your code in this editor

switch attackPattern
{
	case bossAttackPatterns.slowlyPursueAndFireCannons:
		attackPattern = choose(bossAttackPatterns.quicklyMoveTowardsDestinationAndFireShotguns, bossAttackPatterns.moveTowardsCenterAndFireRapid)
		switch attackPattern
		{
			case bossAttackPatterns.quicklyMoveTowardsDestinationAndFireShotguns:
				state = behaviorStates.idle;
				alarm_set(4, room_speed * 5)
				break;
			case bossAttackPatterns.moveTowardsCenterAndFireRapid:
				state = behaviorStates.move;
				break;
		}
		break;
	case bossAttackPatterns.quicklyMoveTowardsDestinationAndFireShotguns:
		attackPattern = choose(bossAttackPatterns.slowlyPursueAndFireCannons, bossAttackPatterns.moveTowardsCenterAndFireRapid)
		switch attackPattern
		{
			case bossAttackPatterns.slowlyPursueAndFireCannons:
				state = behaviorStates.idle;
				alarm_set(4, room_speed * 5)
				break;
			case bossAttackPatterns.moveTowardsCenterAndFireRapid:
				state = behaviorStates.move;
				break;
		}
		break;
	case bossAttackPatterns.moveTowardsCenterAndFireRapid:
		attackPattern = choose(bossAttackPatterns.slowlyPursueAndFireCannons, bossAttackPatterns.quicklyMoveTowardsDestinationAndFireShotguns)
		state = behaviorStates.idle;
		alarm_set(4, room_speed * 5)
		break;
}