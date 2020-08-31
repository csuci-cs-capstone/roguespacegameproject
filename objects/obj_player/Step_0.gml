/// @description Movement
// You can write your code in this editor

upKey = keyboard_check(ord("W"));
downKey = keyboard_check(ord("S"));
leftKey = keyboard_check(ord("A"));
rightKey = keyboard_check(ord("D"));
specialKey = keyboard_check(vk_space);
fireKey = mouse_check_button(mb_left);

x += xVelocity;
y += yVelocity;

trueX += xVelocity;
trueY += yVelocity;

if (specialKey && dodgeCooldown == 0)
{
	dodge = true;
}

if (!dodge)
	{
	xVelocity += xAcceleration;
	yVelocity += yAcceleration;

	xAcceleration = 0;
	yAcceleration = 0;
	xVelocity *= 0.9;
	yVelocity *= 0.9;

	if (localMovement)
	{
		if (upKey || downKey)
		{
			if (downKey)
			{
				yAcceleration += enginePower * sin(degtorad(image_angle));
				xAcceleration += -enginePower * cos(degtorad(image_angle));
			}
			else if (upKey)
			{
				yAcceleration += -enginePower * sin(degtorad(image_angle));
				xAcceleration += enginePower * cos(degtorad(image_angle));
			}
			if (abs(yVelocity) > maxVelocity)
			{
				yVelocity = sign(yVelocity) * maxVelocity;	
			}
		}

		if (leftKey || rightKey)
		{
			if (rightKey)
			{
				xAcceleration += enginePower * sin(degtorad(image_angle));
				yAcceleration += enginePower * cos(degtorad(image_angle));
			}
			else if (leftKey)
			{
				xAcceleration += -enginePower * sin(degtorad(image_angle));
				yAcceleration += -enginePower * cos(degtorad(image_angle));
			}
			if (abs(xVelocity) > maxVelocity)
			{
				xVelocity = sign(xVelocity) * maxVelocity;	
			}
		}
		if (abs(xAcceleration) > enginePower)
		{
			xAcceleration = sign(xAcceleration) * enginePower;	
		}
		if (abs(yAcceleration) > enginePower)
		{
			yAcceleration = sign(yAcceleration) * enginePower;	
		}
	}
	else
	{
		if (upKey || downKey)
		{
			if (downKey)
			{
				yAcceleration = enginePower;
			}
			else if (upKey)
			{
				yAcceleration = -enginePower;
			}
			if (abs(yVelocity) > maxVelocity)
			{
				yVelocity = sign(yVelocity) * maxVelocity;	
			}
		}

		if (leftKey || rightKey)
		{
			if (rightKey)
			{
				xAcceleration = enginePower;
			}
			else if (leftKey)
			{
				xAcceleration = -enginePower;
			}
			if (abs(xVelocity) > maxVelocity)
			{
				xVelocity = sign(xVelocity)* maxVelocity;	
			}
		}
	}
}
else if (!dodging)
{
	dodging = true;
	
	if (upKey || downKey)
	{
		if (downKey)
		{
			yVelocity = maxVelocity * 1.1;
		}
		else if (upKey)
		{
			yVelocity = -maxVelocity * 1.1;
		}
	}

	if (leftKey || rightKey)
	{
		if (rightKey)
		{
			xVelocity = maxVelocity * 1.1;
		}
		else if (leftKey)
		{
			xVelocity = -maxVelocity * 1.1;
		}
	}
	
	image_speed = sign(-xVelocity * sin(degtorad(image_angle)) + -yVelocity * cos(degtorad(image_angle)));
	alarm_set(0, 30);
}

// Weapon Firing

if (dodgeCooldown > 0 && !dodge)
{
	dodgeCooldown--;
}

var leftHardpointX = ((hardpointLeft[0] * sin(degtorad(image_angle))) + (hardpointLeft[1] * cos(degtorad(image_angle)))) + x;
var leftHardpointY = ((hardpointLeft[0] * cos(degtorad(image_angle))) + (hardpointLeft[1] * -sin(degtorad(image_angle)))) + y;

var rightHardpointX = ((hardpointRight[0] * sin(degtorad(image_angle))) + (hardpointRight[1] * cos(degtorad(image_angle)))) + x;
var rightHardpointY = ((hardpointRight[0] * cos(degtorad(image_angle))) + (hardpointRight[1] * -sin(degtorad(image_angle)))) + y;

if (fireKey && countdown <= 0 && !dodging)
{
	if (side == 0)
	{
		var weaponInstance = instance_create_layer(rightHardpointX, rightHardpointY, "Interactible", equippedWeapon)
		side = 1;
	}
	else
	{
		var weaponInstance = instance_create_layer(leftHardpointX, leftHardpointY, "Interactible", equippedWeapon)
		side = 0;
	}
	
	with (weaponInstance)
	{
		direction = other.image_angle;	
		projectileSpeedX = other.xVelocity;
		projectileSpeedY = other.yVelocity;
	}
	countdown = equippedWeapon.projectileCooldown;
}
else if (countdown > 0)
{
	countdown--;	
}

//

// Smooth Rotation

theta = point_direction(x, y, mouse_x, mouse_y);

image_angle += sin(degtorad(theta - image_angle)) * rotationSpeed;

//

// 

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

//