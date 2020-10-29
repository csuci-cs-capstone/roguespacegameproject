/// @description Movement
// You can write your code in this editor

// Ensure that enemy pathfinding always has a valid destination
mp_grid_clear_cell(obj_grid.grid, phy_position_x div global.gridSize, phy_position_y div global.gridSize);

#region // Collision Damage Calculation
if i
{
	previousSpeed1 = phy_speed;
	i = false;
}
else
{
	previousSpeed2 = phy_speed;
	i = true;
}

var difference = abs(phy_speed - max(previousSpeed1, previousSpeed2))

if difference != 0
{
	speedChange = difference;
}
#endregion

if not obj_jumpGraphics.jump
{
	// Smooth Rotation
	var theta = point_direction(phy_position_x, phy_position_y, mouse_x, mouse_y);
	phy_rotation += sin(degtorad(-phy_rotation - theta)) * rotationSpeed;

	#region //Movement
	if !dodging
	{
		if upKey || downKey || leftKey || rightKey
		{
			phy_linear_damping = 1 
		
			var leftRight = rightKey - leftKey;
			var upDown = downKey - upKey;
	
			if leftRight != 0 || upDown != 0
			{
				var theta = point_direction(0, 0, leftRight, upDown);
			
				physics_apply_force(x, y, lengthdir_x(get_stat("engineStat"), theta) , lengthdir_y(get_stat("engineStat"), theta));
			}
		}
		else
		{
			phy_linear_damping = 6
		}
	}
	#endregion

	#region //Dodging
	if !dodging && dodgeCooldown <= 0 && specialKey
	{
		dodging = true;
	
		// Removes all momentum to make the dodge distance more consistent
		// And give the player the ability to instantly react to some things
	
		// Deleting the Old Fixture
		physics_remove_fixture(id, myFix);
	
		#region // Creating a new fixture that would phase through certain objects
		var newFix = physics_fixture_create();
		physics_fixture_set_polygon_shape(newFix);
		physics_fixture_add_point(newFix, 12, 0);
		physics_fixture_add_point(newFix, -7, 10);
		physics_fixture_add_point(newFix, -12, 0);
		physics_fixture_add_point(newFix, -7, -10);
		physics_fixture_set_density(newFix,0.5);
		physics_fixture_set_restitution(newFix,0.1);
		physics_fixture_set_linear_damping(newFix,2);
		physics_fixture_set_angular_damping(newFix,4);
		physics_fixture_set_friction(newFix,0.2);
		physics_fixture_set_collision_group(newFix,-1);
		myFix = physics_fixture_bind(newFix,id);
		physics_fixture_delete(newFix);
		#endregion
	
		var leftRight = rightKey - leftKey;
		var upDown = downKey - upKey;
	
		if leftRight != 0 || upDown != 0
		{
			phy_speed_x = 0;
			phy_speed_y = 0;
			
			var dodgeDirection = point_direction(0, 0, leftRight, upDown);
	
			physics_apply_impulse(x, y, 
									lengthdir_x(get_stat("engineStat") * get_stat("dodgeSpeedMultStat"), dodgeDirection), 
									lengthdir_y(get_stat("engineStat") * get_stat("dodgeSpeedMultStat"), dodgeDirection));
		}
	
		image_speed = (phy_speed_x != 0 ? sign(get_sideways_velocity()) : 1) * 1.5;

		alarm_set(0, room_speed * 0.25)
	}
}
else
{
	phy_rotation += sin(degtorad(-phy_rotation - obj_jumpGraphics.jumpDirection)) * rotationSpeed;
	phy_speed_x = 0;
	phy_speed_y = 0;
	obj_player.phy_position_x = room_width/2
	obj_player.phy_position_y = room_width/2
}

if dodgeCooldown > 0
{
	dodgeCooldown -= 1;	
}
#endregion