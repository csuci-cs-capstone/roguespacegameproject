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

localMovement = false;

dodgeCooldown = 0;
dodge = false;
dodging = false;

hardpointLeft = [-13, -12];
hardpointRight = [13, -12];

playerWeapon = obj_playerWeapon;

leftHardpointX = 0;
leftHardpointY = 0;

rightHardpointX = 0;
rightHardpointY = 0;

var weapon = instance_create_layer(0, 0, "Interactible", playerWeapon);
weapon.side = 0;

var weapon = instance_create_layer(0, 0, "Interactible", playerWeapon);
weapon.side = 1;

flash = 0

trueX = x;
trueY = y;

alarm_set(1, room_speed);