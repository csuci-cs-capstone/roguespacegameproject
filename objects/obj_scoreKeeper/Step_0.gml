/// @description Insert description here
// You can write your code in this editor

if abs(obj_universe.playerSectorX) > furthestSectorX
{
	furthestSectorX = abs(obj_universe.playerSectorX)	
}

if abs(obj_universe.playerSectorY) > furthestSectorY
{
	furthestSectorY = abs(obj_universe.playerSectorY)
}

furthestDistance = furthestSectorX + furthestSectorY;

if instance_exists(obj_player) && obj_player.money > mostAmountOfScrap
{
	mostAmountOfScrap = obj_player.money;	
}