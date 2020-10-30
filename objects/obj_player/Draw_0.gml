/// @description Insert description here
// You can write your code in this editor

draw_self();

if canRecharge && shieldAlpha > 0
{
	draw_sprite_ext(spr_shields, 0, x, y, 1, 1, -phy_rotation, c_white, shieldAlpha)
}

if (flash > 0)
{
	flash--;
	shader_set(SH_White);
	draw_self();
	shader_reset();
}