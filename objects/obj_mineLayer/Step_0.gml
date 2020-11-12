/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

if step
{
	switch state
	{
		case behaviorStates.calcDestG:
			behavior_calcDestG();
			break;
		case behaviorStates.calcDestR:
			behavior_calcDestR();
			state = behaviorStates.move
			break;
		case behaviorStates.calcDestSR:
			behavior_calcDestSR();
			break;
		case behaviorStates.idle:
			behavior_idle();
			break;
		case behaviorStates.drift:
			behavior_drift();
			break;
		case behaviorStates.move:
			behavior_move();
			if get_distance_to_dest() < 10
			{
				state = behaviorStates.calcDestR;
			}
			break;
		case behaviorStates.pursue:
			behavior_pursue();
			break;
		case behaviorStates.attracted:
			behavior_attracted();
			break;
		case behaviorStates.dash:
			behavior_dash();
			break;
		case behaviorStates.startTele:
			break;
		case behaviorStates.teleport:
			behavior_teleport();
			break;
		case behaviorStates.endTele:
			break;
		case behaviorStates.avoid:
			behavior_avoid();
			break;
		case behaviorStates.attack:
			break;
		default:
			behavior_idle();
			break;
	}
}

lay_mine()