/// @description Insert description here
// You can write your code in this editor

aimTowards = 0;
phy_fixed_rotation = true;
damage = get_stat("damageStat");

alarm_set(0, (room_speed * get_stat("pulseLifetimeStat"))/8)

listOfCollisions = ds_list_create();
collisionBlacklist = ds_list_create();