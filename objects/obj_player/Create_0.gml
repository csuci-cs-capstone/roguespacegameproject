/// @description Initial Variables
// You can write your code in this editor

xVelocity = 0;
yVelocity = 0;
xAcceleration = 0;
yAcceleration = 0;
theta = 0;

maxHealth = 6;
health = maxHealth;

image_speed = 0;

rotationSpeed = 20;
maxVelocity = 8;
enginePower = 1

localMovement = false;

countdown = 0;
dodgeCooldown = 0;
dodge = false;
dodging = false;

hardpointLeft = [-12, 10];
hardpointRight = [12, 10];

equippedWeapon = obj_defaultWeapon;

flash = 0

side = 0;

trueX = x;
trueY = y;

alarm_set(1, room_speed);