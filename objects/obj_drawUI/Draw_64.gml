/// @description Insert description here
// You can write your code in this editor

//draw_text(32, 64, "Entity Count = " + string(instance_number(obj_player) + instance_number(obj_defaultEnemyParams) + instance_number(obj_simpleProjectile) + instance_number(obj_obstacleParent) + instance_number(obj_enemyWeapons)));

draw_sprite(spr_staticUI, -1, 0, 0);
var subImage = ceil((obj_player.currentHealth * 25) / get_stat("hullStat"))
if subImage < 0
{
	subImage = 0	
}
draw_sprite(spr_health, subImage, 8, 8)

draw_text(17, 31, string(obj_player.money));

draw_radar_blip(obj_defaultEnemyParams, spr_enemyBlip);		// Enemy Blips
draw_radar_blip(obj_obstacleParent, spr_obstacleBlip);		// Obstacle Blips
// draw_radar_blip(obj_simpleProjectile, spr_projectileBlip);	// Player Projectile Blips
// draw_radar_blip(obj_enemyWeapons, spr_projectileBlip);		// Enemy Weapon Blips
draw_radar_blip(obj_player, spr_playerBlip);				// Player Blip

// Menu

mousex = window_mouse_get_x() / round(view_wport[0]/640);
mousey = window_mouse_get_y() / round(view_hport[0]/360);

if mouse_check_button_pressed(mb_left)
{
	infoIndex = 0;
}

if (keyboard_check(vk_tab))
{
	draw_menu()
}

//if (obj_gameOver.dead)
//{
//	draw_text(640, 360, "GAME OVER");	
//}