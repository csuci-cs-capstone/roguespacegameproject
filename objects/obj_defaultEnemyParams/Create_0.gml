/// @description Initialize flash variable
// You can write your code in this editor

flash = 0;
phy_fixed_rotation = true;

rotationSpeed = 20;
enginePower = 200;

myPath = path_add();

enum behaviorStates
{
	idle,		// Enemy will not move
	wander,		// Enemy will move in random directions
	pursue,		// Enemy will pursue the player
	orbit,		// Enemy will orbit around the player
	flank,		// Enemy will move to a random direction
	dash,		// Enemy will dash in a direction
	teleport,	// Enemy will teleport to a random location
	avoid		// Enemy will move away from the player
}

state = behaviorStates.idle