/// @description Insert description here
// You can write your code in this editor

//for (var xx = 0; xx < 50; xx++)
//{
//	for (var yy = 0; yy < 50; yy++)
//	{
//		//var noise = ((perlin_noise(xx/4, yy/4, vector_array) + 1) / 2) * 255
		
//		var noise = ((perlin_octaves(xx/8, yy/8, 6, 0.5, vector_array) + 1) / 2) * 255
		
//		draw_set_color(make_color_rgb(noise, noise, noise));
		
//		noise = ((power(perlin_octaves(xx/2, yy/2, 1, 0.5, vector_array), 7.5) + 1) / 2) * 255
//		if noise >= 128
//		{
//			draw_set_color(make_color_rgb(255, 255, 0));
//		}
		
//		draw_rectangle(xx*4, yy*4, (xx*4)+4, (yy*4)+4, false);
//	}
//}