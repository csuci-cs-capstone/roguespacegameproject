/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

rotationSpeed = 2
maxHealth = 2500;
enginePower = 5000;
currentHealth = maxHealth;

depth = -1;

global.bossLevel = 3;
danger = 1000;
value = 50;

instance_create_layer(x, y, "OtherLogic", obj_BossWeaponController)

switch(global.bossLevel)
{
	case 3:
		innerShellLeft = instance_create_layer(x + lengthdir_x(30.2654919008, 82.40535663), y + lengthdir_y(30.2654919008, 82.40535663), "Interactible", obj_BossInnerShellLeft)
		innerJointLeft = physics_joint_prismatic_create(self, innerShellLeft, x, y, innerShellLeft.x, innerShellLeft.y, 0, 0, true, 0, 0, false, false);
		innerShellRight = instance_create_layer(x + lengthdir_x(30.2654919008, -82.40535663), y + lengthdir_y(30.2654919008, -82.40535663), "Interactible", obj_BossInnerShellRight)
		innerJointRght = physics_joint_prismatic_create(self, innerShellRight, x, y, innerShellRight.x, innerShellRight.y, 0, 0, true, 0, 0, false, false);
		
		outerShellLeft = instance_create_layer(x + lengthdir_x(42.9418211072, 62.2414594), y + lengthdir_y(42.9418211072, 62.2414594), "Interactible", obj_BossOuterShellLeft)
		outerJointLeft = physics_joint_prismatic_create(self, outerShellLeft, x, y, outerShellLeft.x, outerShellLeft.y, 0, 0, true, 0, 0, false, false);
		outerShellRight = instance_create_layer(x + lengthdir_x(42.9418211072, -62.2414594), y + lengthdir_y(42.9418211072, -62.2414594), "Interactible", obj_BossOuterShellRight)
		outerJointRight = physics_joint_prismatic_create(self, outerShellRight, x, y, outerShellRight.x, outerShellRight.y, 0, 0, true, 0, 0, false, false);
		break;
	case 2:
		innerShellLeft = instance_create_layer(x + lengthdir_x(30.2654919008, 82.40535663), y + lengthdir_y(30.2654919008, 82.40535663), "Interactible", obj_BossInnerShellLeft)
		innerJointLeft = physics_joint_prismatic_create(self, innerShellLeft, x, y, innerShellLeft.x, innerShellLeft.y, 0, 0, true, 0, 0, false, false);
		innerShellRight = instance_create_layer(x + lengthdir_x(30.2654919008, -82.40535663), y + lengthdir_y(30.2654919008, -82.40535663), "Interactible", obj_BossInnerShellRight)
		innerJointRght = physics_joint_prismatic_create(self, innerShellRight, x, y, innerShellRight.x, innerShellRight.y, 0, 0, true, 0, 0, false, false);
		break;
}

enum bossAttackPatterns
{
	slowlyPursueAndFireCannons,
	quicklyMoveTowardsDestinationAndFireShotguns,
	moveTowardsCenterAndFireRapid,
	
	idleAndFireBigMissile,
	moveTowardsCenterAndFireSwarm,
	spreadMines,
	
	quicklyPursuePlayerAndFireHeavyLaser,
	moveTowardsCenterAndAim,
	
	none
}

state = behaviorStates.idle

attackPattern = bossAttackPatterns.none;
alarm_set(5, room_speed * 2)

destination = [room_width/2, room_height/2];

dying = false;
