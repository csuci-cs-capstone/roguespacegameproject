// @function				draw_radar_blip(_object, _sprite);
// @param {index} _object	Object to track
// @param {index} _sprite	Sprite to represent object in radar

function draw_radar_blip(_object, _sprite)
{
	with (_object)
	{
		draw_sprite(_sprite, -1, (575 + (x / 21.5517241379)) * (view_wport[0] / 640), (295  + (y / 21.5517241379)) * (view_hport[0] / 360))
	}
}