/// @description Insert description here
// You can write your code in this editor

x += (projectileSpeed * cos(degtorad(direction))) + projectileSpeedX;
y += (projectileSpeed * -sin(degtorad(direction))) + projectileSpeedY;

lifeTime--;

if (lifeTime <= 0)
{
	instance_destroy();	
}