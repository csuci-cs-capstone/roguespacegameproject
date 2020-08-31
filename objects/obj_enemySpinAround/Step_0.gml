/// @description Insert description here
// You can write your code in this editor

if (instance_exists(obj_player))
{
	theta = point_direction(x, y, obj_player.x, obj_player.y);
	image_angle += sin(degtorad(theta - image_angle)) * rotationSpeed;
}

x += xVelocity;
y += yVelocity;

trueX += xVelocity;
trueY += yVelocity;


xVelocity += xAcceleration;
yVelocity += yAcceleration;

if (abs(xVelocity) > maxVelocity)
{
	xVelocity = sign(xVelocity) * maxVelocity;	
}
if (abs(yVelocity) > maxVelocity)
{
	yVelocity = sign(yVelocity) * maxVelocity;	
}

xAcceleration = 0;
yAcceleration = 0;
xVelocity *= 0.9;
yVelocity *= 0.9;

if (distance_to_object(obj_player) > 200)
{
	yAcceleration += -enginePower * sin(degtorad(image_angle));
	xAcceleration += enginePower * cos(degtorad(image_angle));
}

xAcceleration += surroundDirection * enginePower * sin(degtorad(image_angle));
yAcceleration += surroundDirection * enginePower * cos(degtorad(image_angle));

if (countdown <= 0)
{
	var weaponInstance = instance_create_layer(x, y, "Interactible", equippedWeapon)
	countdown = equippedWeapon.projectileCooldown;
	with (weaponInstance)
	{
		direction = other.image_angle;
		projectileSpeedX = other.xVelocity;
		projectileSpeedY = other.yVelocity;
		instance_destroy();
	}
}
else if (countdown > 0)
{
	countdown--;	
}

if (enemyHealth <= 0)
{
	instance_destroy();	
}

if (trueX > 2500)
{
	trueX = 0;
}
else if (trueX < 0)
{
	trueX = 2500;
}

if (trueY > 2500)
{
	trueY = 0;	
}
else if (trueY < 0)
{
	trueY = 2500;	
}