/// @description Insert description here
// You can write your code in this editor

if closeEnough && !obj_gameOver.dead
{
	draw_set_halign(fa_center);
	if instance_exists(obj_player) && obj_player.money > 20
	{
		draw_set_color(c_green)
		draw_text_transformed(320, 100, "Press [E] to repair 10 health for 20 scrap.", 2, 2, 0);
	}
	else
	{
		draw_set_color(c_red)
		draw_text_transformed(320, 100, "You need 20 scrap!", 2, 2, 0);
	}
	draw_set_color(c_white)
	draw_set_halign(fa_left);
}