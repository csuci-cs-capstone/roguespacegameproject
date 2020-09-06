/// @description Insert description here
// You can write your code in this editor

draw_text(32, 32, "FPS = " + string(fps));
draw_text(32, 64, "Entity Count = " + string(instance_number(obj_player) + instance_number(obj_defaultEnemyParams) + instance_number(obj_simpleProjectile) + instance_number(obj_obstacleParent) + instance_number(obj_enemyWeapons)));

draw_sprite(spr_radarBackground, -1, 1080, 520);

draw_sprite(spr_equippedWeaponBackground, -1, 50, 610);
draw_sprite_ext(object_get_sprite(obj_playerWeapon), 0, 80, 635, 4, 4, 0, c_white, 1);

draw_radar_blip(obj_defaultEnemyParams, spr_enemyBlip);
draw_radar_blip(obj_obstacleParent, spr_obstacleBlip);
draw_radar_blip(obj_simpleProjectile, spr_projectileBlip);
draw_radar_blip(obj_enemyWeapons, spr_projectileBlip);
draw_radar_blip(obj_player, spr_playerBlip);


if (obj_gameOver.dead)
{
	draw_text(640, 360, "GAME OVER");	
}