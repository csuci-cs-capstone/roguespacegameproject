/// @description Insert description here
// You can write your code in this editor

event_inherited()

lifeTime = 10 * room_speed;
alarm_set(0, lifeTime)

rotationSpeed = get_stat("projectileSpeedStat")/2;
enginePower = get_stat("projectileSpeedStat");

canDestroy = false;

phy_fixed_rotation = true;

image_index = 0
image_speed = 0.5