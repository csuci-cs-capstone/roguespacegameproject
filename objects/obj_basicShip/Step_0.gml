/// @description Insert description here
// You can write your code in this editor

switch behaviorStates
{
	case behaviorStates.calcDestG:
		behavior_idle()
		break;
	case behaviorStates.calcDestR:
		destination = behavior_calcDestG();
		break;
	case behaviorStates.calcDestSR:
		break;
	case behaviorStates.idle:
		break;
	case behaviorStates.move:
		break;
	case behaviorStates.pursue:
		break;
	case behaviorStates.attracted:
		break;
	case behaviorStates.dash:
		break;
	case behaviorStates.dashing:
		break;
	case behaviorStates.startTele:
		break;
	case behaviorStates.teleport:
		break;
	case behaviorStates.endTele:
		break;
	case behaviorStates.avoid:
		break;
	default:
		behavior_idle();
		break;
}