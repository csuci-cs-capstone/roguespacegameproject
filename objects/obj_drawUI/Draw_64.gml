/// @description Insert description here
// You can write your code in this editor

draw_sprite(spr_radarBackground, -1, 1080, 520);


draw_sprite(spr_equippedWeaponBackground, -1, 50, 610);
draw_sprite_ext(object_get_sprite(obj_playerWeapon), 0, 80, 635, 4, 4, 0, c_white, 1);

if (instance_exists(obj_player))
{
	draw_sprite(spr_playerBlip , -1, 1080 + obj_player.x / 16.66, 520 + obj_player.y / 16.66)
}
if (instance_exists(obj_defaultEnemyParams))
{
	var i;
	for (i = 0; i < instance_number(obj_defaultEnemyParams); i++)
	{
		draw_sprite(spr_enemyBlip, -1, 1080 + (instance_find(obj_defaultEnemyParams, i).x / 16.66), 520 + (instance_find(obj_defaultEnemyParams, i).y / 16.66))
	}
}

if (obj_gameOver.dead)
{
	draw_text(640, 360, "GAME OVER");	
}