/// @description Insert description here
// You can write your code in this editor

//draw_text(32, 64, "Entity Count = " + string(instance_number(obj_player) + instance_number(obj_defaultEnemyParams) + instance_number(obj_simpleProjectile) + instance_number(obj_obstacleParent) + instance_number(obj_enemyWeapons)));

draw_sprite_ext(spr_staticUI, -1, 0, 0, view_wport[0]/640, view_hport[0]/360, 0, c_white, 1);

draw_sprite_ext(spr_health, ceil((obj_player.currentHealth * 25) / obj_player.maxHealth), 8 * view_wport[0]/640, 8 * view_hport[0]/360, view_wport[0]/640, view_hport[0]/360, 0, c_white, 1)

draw_text_transformed(17 * view_wport[0]/640, 31 * view_hport[0]/360, string(obj_player.money), view_wport[0]/640, view_hport[0]/360, 0);

draw_radar_blip(obj_defaultEnemyParams, spr_enemyBlip);		// Enemy Blips
draw_radar_blip(obj_obstacleParent, spr_obstacleBlip);		// Obstacle Blips
// draw_radar_blip(obj_simpleProjectile, spr_projectileBlip);	// Player Projectile Blips
// draw_radar_blip(obj_enemyWeapons, spr_projectileBlip);		// Enemy Weapon Blips
draw_radar_blip(obj_player, spr_playerBlip);				// Player Blip

// Menu
draw_menu()

if (obj_gameOver.dead)
{
	draw_text(640, 360, "GAME OVER");	
}