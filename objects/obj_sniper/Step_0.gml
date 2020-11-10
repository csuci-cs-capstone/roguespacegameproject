/// @description Insert description here
// You can write your code in this editor

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
			destGenX = obj_player.phy_position_x
			destGenY = obj_player.phy_position_y
			behavior_calcDestSR();
			state = behaviorStates.move
			break;
		case behaviorStates.idle:
			behavior_idle();
			if canShoot
			{
				drawLine = false;
				state = behaviorStates.calcDestSR	
			}
			break;
		case behaviorStates.drift:
			behavior_drift();
			break;
		case behaviorStates.move:
			behavior_move();
			if get_distance_to_dest() < 10 || distance_to_object(obj_projectileParent) <= 40
			{
				state = behaviorStates.attack;	
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
			if !canSee
			{
				state = behaviorStates.calcDestSR
			}
			else
			{
				drawLine = true;
				alarm_set(0, room_speed)
			}
			state = behaviorStates.idle;
			break;
		default:
			behavior_idle();
			break;
	}
}

attack_beam()