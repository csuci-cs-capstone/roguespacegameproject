/// @description Insert description here
// You can write your code in this editor

draw_sprite(spr_radarBackground, -1, 1080, 520);

if (instance_exists(obj_player))
{
	draw_sprite(spr_playerBlip , -1, 1080 + obj_player.trueX / 16.66, 520 + obj_player.trueY / 16.66)
}
if (instance_exists(obj_defaultEnemyParams))
{
	var i;
	for (i = 0; i < instance_number(obj_defaultEnemyParams); i++)
	{
		draw_sprite(spr_enemyBlip, -1, 1080 + (instance_find(obj_defaultEnemyParams, i).trueX / 16.66), 520 + (instance_find(obj_defaultEnemyParams, i).trueY / 16.66))
	}
}

draw_set_color(c_yellow);

if (instance_exists(obj_player))
{
	draw_text(20, 70, "X: " + string(obj_player.trueX));
	draw_text(20, 90, "Y: " + string(obj_player.trueY));
}

draw_set_color(c_red);

for (var i = 1; i <= health; i++)
{
	draw_rectangle(20 + (25 * i), 20, 40 + (25 * i), 60, false);
}

draw_text(20, 130, "DIFFICULTY: NOT SET");

draw_text(20, 150, "NUMBER OF ENEMIES: " + string(instance_number(obj_defaultEnemyParams)));

if (obj_gameOver.dead)
{
	draw_text(640, 360, "GAME OVER");	
}