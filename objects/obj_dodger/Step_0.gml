/// @description Insert description here
// You can write your code in this editor

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
			break;
		case behaviorStates.calcDestSR:
			behavior_calcDestSR();
			break;
		case behaviorStates.idle:
			behavior_idle();
			if instance_exists(obj_player) && (distance_to_object(obj_player) > 100 || !canSee)
			{
				state = behaviorStates.pursue;	
			}
			if distance_to_object(obj_player) <= 60
			{
				state = behaviorStates.avoid;	
			}
			if canDodge && distance_to_object(obj_allPlayerProjectiles) <= 50
			{
				previousState = behaviorStates.idle
				state = behaviorStates.dash;	
			}
			break;
		case behaviorStates.drift:
			behavior_drift();
			break;
		case behaviorStates.move:
			behavior_move();
			break;
		case behaviorStates.pursue:
			behavior_pursue();
			if !instance_exists(obj_player) || (distance_to_object(obj_player) <= 100 && canSee)
			{
				state = behaviorStates.idle;	
			}
			if canDodge && distance_to_object(obj_allPlayerProjectiles) <= 50
			{
				previousState = behaviorStates.pursue
				state = behaviorStates.dash;	
			}
			break;
		case behaviorStates.attracted:
			behavior_attracted();
			break;
		case behaviorStates.dash:
			behavior_dash();
			state = previousState;
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
			if distance_to_object(obj_player) > 80
			{
				state = behaviorStates.idle;	
			}
			if canDodge && distance_to_object(obj_allPlayerProjectiles) <= 50
			{
				previousState = behaviorStates.avoid
				state = behaviorStates.dash;	
			}
			break;
		default:
			behavior_idle();
			break;
	}
}

attack_burst3()