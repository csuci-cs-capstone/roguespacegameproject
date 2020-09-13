/// @description Draw Flash
// You can write your code in this editor

draw_self();

draw_path(myPath, 0, 0, true);

if (flash > 0)
{
	flash--;
	shader_set(SH_White);
	draw_self();
	shader_reset();
}