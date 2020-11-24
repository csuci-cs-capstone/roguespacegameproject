/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
if i
{
	previousSpeed1 = phy_speed;
	i = false;
}
else
{
	previousSpeed2 = phy_speed;
	i = true;
}

var difference = abs(phy_speed - max(previousSpeed1, previousSpeed2))

if difference != 0
{
	speedChange = difference;
}

//

if !step
{
	if instance_exists(obj_player)
	{
		ds_list_clear(collisionList)
		collision_line_list(phy_position_x, phy_position_y, obj_player.phy_position_x, obj_player.phy_position_y, obj_obstacleParent, false, true, collisionList, true)
		canSee = ds_list_empty(collisionList)
	}
	step = 1
}
else
{
	step = 0	
}

clamp(accuracy, 0, 360);

mp_grid_clear_cell(obj_grid.grid, phy_position_x div global.gridSize, phy_position_y div global.gridSize); // Make the grid the enemy occupies valid, to reduce the number of invalid path generations

// If the enemi is in a drift state, it will not actively point towards the player, and its rotation will be affected by physics

if state == behaviorStates.drift
{
	phy_fixed_rotation = false;
}
else
{
	phy_fixed_rotation = true;
	if instance_exists(obj_player)
	{
		var playerTheta = point_direction(phy_position_x, phy_position_y, obj_player.phy_position_x, obj_player.phy_position_y);
		phy_rotation += sin(degtorad(-phy_rotation - playerTheta)) * rotationSpeed;
	}
}

// Destroy enemy if the enemy drops below 0
//if currentHealth < 0
//{
//	instance_destroy();
//}

// Movement direction is calculated every step, but movement is applied every step
if state == behaviorStates.attracted || state == behaviorStates.avoid || state == behaviorStates.move || state == behaviorStates.pursue
{
	physics_apply_force(phy_position_x, phy_position_y, lengthdir_x(enginePower, movementDirection), lengthdir_y(enginePower, movementDirection))	
}

//

switch global.bossLevel
{
	case 3:
		switch attackPattern
		{
			case bossAttackPatterns.slowlyPursueAndFireCannons:
				enginePower = 8000;
				if step
				{
					switch state
					{
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
							break;
						case behaviorStates.pursue:
							behavior_pursue();
							if !instance_exists(obj_player) || (distance_to_object(obj_player) <= 100 && canSee)
							{
								state = behaviorStates.idle;	
							}
							break;
						case behaviorStates.avoid:
							behavior_avoid();
							if distance_to_object(obj_player) > 80
							{
								state = behaviorStates.idle;	
							}
							break;
						default:
							behavior_idle();
							break;
					}
				}
				break;
			case bossAttackPatterns.quicklyMoveTowardsDestinationAndFireShotguns:
				enginePower = 12000;
				if step
				{
					switch state
					{
						case behaviorStates.idle:
							behavior_idle();
							if instance_exists(obj_player) && (distance_to_object(obj_player) > 30 || !canSee)
							{
								state = behaviorStates.pursue;	
							}
							if distance_to_object(obj_player) <= 10
							{
								state = behaviorStates.avoid;	
							}
							break;
						case behaviorStates.pursue:
							behavior_pursue();
							if !instance_exists(obj_player) || (distance_to_object(obj_player) <= 25 && canSee)
							{
								state = behaviorStates.idle;	
							}
							break;
						case behaviorStates.avoid:
							behavior_avoid();
							if distance_to_object(obj_player) > 20
							{
								state = behaviorStates.idle;	
							}
							break;
						default:
							behavior_idle();
							break;
					}
				}
				break;
			case bossAttackPatterns.moveTowardsCenterAndFireRapid:
				enginePower = 10000
				switch state
				{
					case behaviorStates.move:
						behavior_move();
						if get_distance_to_dest() < 20
						{
							alarm_set(4, room_speed * 5)	
							state = behaviorStates.attack;	
						}
						break;
					default:
						behavior_idle();
						break;
				}
				break;
		}
		break;
	case 2:
		
		break;
	case 1:
		break;
}

if currentHealth < 0
{
	currentHealth = 0;
	attackPattern = bossAttackPatterns.none;
	if !dying
	{
		alarm_set(6, room_speed * 3)
		dying = true
	}
}

if dying
{
	phy_linear_damping = 20;
	phy_angular_damping = 20;
	phy_position_x += random_range(-5, 5)
	phy_position_y += random_range(-5, 5)
	
	part_emitter_region(global.particleSystem, global.jumpChargeEmitter, 
						x + 100,
						x - 100,
						y + 100,
						y - 100,
						ps_shape_ellipse, ps_distr_invgaussian);
			
	part_type_direction(global.jumpParticle, 0, 360, 0, 0);
			
	part_emitter_burst(global.particleSystem, global.jumpChargeEmitter, global.jumpParticle, (1 - (alarm_get(6)/(room_speed*3))) * 20);
}