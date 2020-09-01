/// @description Initial Variables
// You can write your code in this editor

xVelocity = 0;
yVelocity = 0;
xAcceleration = 0;
yAcceleration = 0;
theta = 0;

maxHealth = 6;
health = maxHealth;
depth = 0;

image_speed = 0;

rotationSpeed = 20;
maxVelocity = 8;
enginePower = 1

// Up Down Left Right Relative to either the universe or the player ship

localMovement = false;

//

dodgeCooldown = 0;
dodge = false;
dodging = false;

// Placement of Weapons

hardpointLeft = [-13, -12];
hardpointRight = [13, -12];

//

// Creating Weapon Objects

playerWeapon = obj_playerWeapon;

var weapon = instance_create_layer(0, 0, "Interactible", playerWeapon);
weapon.side = 0;

var weapon = instance_create_layer(0, 0, "Interactible", playerWeapon);
weapon.side = 1;

side = 0;

//

flash = 0

alarm_set(1, room_speed);