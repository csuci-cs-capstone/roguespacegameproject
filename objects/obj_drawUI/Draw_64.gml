/// @description Insert description here
// You can write your code in this editor

draw_text(32, 64, "Entity Count = " + string(instance_number(obj_player) + instance_number(obj_defaultEnemyParams) + instance_number(obj_simpleProjectile) + instance_number(obj_obstacleParent) + instance_number(obj_enemyWeapons)));

if (instance_exists(obj_player))
{
	draw_text(32, 85, "Health = " + string(obj_player.currentHealth))
	draw_text(32, 105, "PrevSp = " + string(obj_player.speedChange))
}

draw_sprite(spr_radarBackground, -1, 1080, 520);

draw_sprite(spr_equippedWeaponBackground, -1, 50, 610);
draw_sprite_ext(object_get_sprite(obj_playerWeapon), 0, 80, 635, 4, 4, 0, c_white, 1);

draw_radar_blip(obj_defaultEnemyParams, spr_enemyBlip);		// Enemy Blips
draw_radar_blip(obj_obstacleParent, spr_obstacleBlip);		// Obstacle Blips
// draw_radar_blip(obj_simpleProjectile, spr_projectileBlip);	// Player Projectile Blips
// draw_radar_blip(obj_enemyWeapons, spr_projectileBlip);		// Enemy Weapon Blips
draw_radar_blip(obj_player, spr_playerBlip);				// Player Blip


if (obj_gameOver.dead)
{
	draw_text(640, 360, "GAME OVER");	
}