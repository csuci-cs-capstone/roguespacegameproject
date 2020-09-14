// @function				draw_radar_blip(_object, _sprite);
// @param {index} _object	Object to track
// @param {index} _sprite	Sprite to represent object in radar

function draw_radar_blip(_object, _sprite)
{
	if (instance_exists(_object))
	{
		var i;
		for (i = 0; i < instance_number(_object); i++)
		{
			draw_sprite(_sprite, -1, 1080 + (instance_find(_object, i).x / 16.66), 520 + (instance_find(_object, i).y / 16.66))
		}
	}	
}