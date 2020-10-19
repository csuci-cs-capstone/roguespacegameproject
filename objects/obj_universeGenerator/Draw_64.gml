/// @description Insert description here
// You can write your code in this editor

for (var xx = 0; xx < 360; xx++)
{
	for (var yy = 0; yy < 360; yy++)
	{
		var noise = (perlin_noise(xx/16, yy/16, vector_array) + 1) * 127
		draw_set_color(make_color_rgb(noise, noise, noise))
		draw_rectangle(xx, yy, xx+1, yy+1, false);
	}
}