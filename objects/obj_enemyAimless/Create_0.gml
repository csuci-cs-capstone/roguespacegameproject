/// @description Insert description here
// You can write your code in this editor

trueX = x;
trueY = y;

xVelocity = 0;
yVelocity = 0;
xAcceleration = 0;
yAcceleration = 0;
theta = 0;

image_speed = 0;

rotationSpeed = 20;
maxVelocity = 5;
enginePower = 1;

randDirection = random_range(-5, 5);

xVelocity = randDirection;
yVelocity = randDirection - sign(randDirection) * maxVelocity;

equippedWeapon = obj_bigFast;

countdown = 0;

enemyHealth = 6;

flash = 0;