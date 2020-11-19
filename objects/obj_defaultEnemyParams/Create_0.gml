/// @description Initialize variables
// You can write your code in this editor

flash = 0;
phy_fixed_rotation = true;

rotationSpeed = 20;
enginePower = 160;

myPath = path_add();
collisionList = ds_list_create();

enum behaviorStates
{
	calcDestG,		// Enemy will calculate random destination, used for other states
	calcDestR,		// Enemy will calculate a random destination in a radius surrounding the enemy, used for other states
	calcDestSR,		// Enemy will calculate a random destination in a specific distance surrounding the enemy, used for other states
	idle,			// Enemy will not move
	drift,			// Enemy will not move with no damping
	move,			// Enemy will move to a generated destination (generated by calcDestG, calcDestR, or calcDestSR)
	pursue,			// Enemy will move towards the player
	attracted,		// Enemy will move towards player, will not avoid obstacles
	dash,			// Enemy will dash in a direction
	startTele,		// Enemy will begin Start Teleport Animation
	teleport,		// Enemy will teleport to a location
	endTele,		// Enemy will begin End Teleport Animation
	avoid,			// Enemy will move away from the player
	avoidProjectile,// Enemy will attempt to move away from any near projectiles
	attack			// Enemy will charge their weapon
}

canDodge = true;	// Boolean if enemy dash is charged
dodging = false;	// Enemy cannot attack when dashing

state = behaviorStates.pursue
previousState = behaviorStates.idle

canSee = true;		// Boolean if there is no obstacle between the enemy and player
canShoot = false;	// Boolean if the enemy has its weapon charged

// These values can potentially change within the finite state machine
destination = [-1, -1];		// Modified in the calcDestG or calcDestR state
dodgeDirection = 0;			// Direction to dash when dashing
destGenX = 0;				// x coordinate where a destination is generated around
destGenY = 0;				// y coordinate where a destination is generated around
radius = 0;				// Radius surrounding a coordinates where a destination is generated

// These values may be changed in the create of each enemy
accuracy = 90;			// Accuracy, divided by 180 to calculate spread
weapon = obj_basic		// Weapon that the enemy will use
rCheck = 3				// Radius to look for valid coordinates if the random coordinates generated is invalid
danger = 0				// danger value of an enemy, used to determine how many of each enemy to spawn

// Default health variables
maxHealth = 100;
currentHealth = maxHealth;

// Variables used for collision damage calculation
previousSpeed1 = 0;
previousSpeed2 = 0;
i = true;

speedChange = 0;

// Enemy decisions are done every other step to improve performance

step = 1;
movementDirection = 0;

// How much scrap the enemy can potentially drop

value = 0;
dropMoney = true;

//

objectName = object_index