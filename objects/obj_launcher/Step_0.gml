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
			break;
		case behaviorStates.calcDestSR:
			behavior_calcDestSR();
			break;
		case behaviorStates.idle:
			behavior_idle();
			if instance_exists(obj_player) && (distance_to_object(obj_player) > 120 || !canSee)
			{
				state = behaviorStates.pursue;	
			}
			if distance_to_object(obj_player) <= 80
			{
				state = behaviorStates.avoid;	
			}
			if distance_to_object(obj_projectileParent) <= 50
			{
				previousState = behaviorStates.idle
				state = behaviorStates.avoidProjectile;	
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
			if !instance_exists(obj_player) || (distance_to_object(obj_player) <= 120 && canSee)
			{
				state = behaviorStates.idle;	
			}
			if distance_to_object(obj_projectileParent) <= 50
			{
				previousState = behaviorStates.pursue
				state = behaviorStates.avoidProjectile;	
			}
			break;
		case behaviorStates.attracted:
			behavior_attracted();
			break;
		case behaviorStates.dash:	
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
			if distance_to_object(obj_player) > 100
			{
				state = behaviorStates.idle;	
			}
			break;
		case behaviorStates.avoidProjectile:
			behavior_avoid_projectile()
			if distance_to_object(obj_projectileParent) > 50
			{
				state = previousState;
			}
			break;
		default:
			behavior_idle();
			break;
	}
}

swarm_missile()