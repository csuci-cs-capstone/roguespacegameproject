/// @description Movement
// You can write your code in this editor

// Smooth Rotation

var theta = point_direction(phy_position_x, phy_position_y, mouse_x, mouse_y);

//phy_rotation = -theta;
//physics_apply_torque((sin(degtorad(-phy_rotation - theta)) * rotationSpeed));

phy_rotation += sin(degtorad(-phy_rotation - theta)) * rotationSpeed;

//

mp_grid_clear_cell(obj_grid.grid, phy_position_x div obj_grid.gridSize, phy_position_y div obj_grid.gridSize);

//

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
	
			physics_apply_force(x, y, lengthdir_x(enginePower, theta) , lengthdir_y(enginePower, theta));
		}
	}
	else
	{
		phy_linear_damping = 5
	}
}
if !dodging && dodgeCooldown <= 0 && specialKey
{
	dodging = true;
	
	// Removes all momentum to make the dodge distance more consistent
	// And give the player the ability to instantly react to some things
	phy_speed_x = 0;
	phy_speed_y = 0;
	
	// Deleting the Old Fixture
	physics_remove_fixture(id, myFix);
	
	// Creating a new fixture that would phase through certain objects
	var newFix = physics_fixture_create();
	physics_fixture_set_polygon_shape(newFix);
	physics_fixture_add_point(newFix, 24, 0);
	physics_fixture_add_point(newFix, -13, 20);
	physics_fixture_add_point(newFix, -24, 0);
	physics_fixture_add_point(newFix, -13, -20);
	physics_fixture_set_density(newFix,0.5);
	physics_fixture_set_restitution(newFix,0.1);
	physics_fixture_set_linear_damping(newFix,2);
	physics_fixture_set_angular_damping(newFix,4);
	physics_fixture_set_friction(newFix,0.2);
	physics_fixture_set_collision_group(newFix,-1);
	myFix = physics_fixture_bind(newFix,id);
	physics_fixture_delete(newFix);
	
	var leftRight = rightKey - leftKey;
	var upDown = downKey - upKey;
	
	if leftRight != 0 || upDown != 0
	{
		var dodgeDirection = point_direction(0, 0, leftRight, upDown);
	
		physics_apply_impulse(x, y, lengthdir_x(enginePower, dodgeDirection) , lengthdir_y(enginePower, dodgeDirection));
	}
	
	image_speed = (phy_speed_x != 0 ? sign(-phy_speed_x) : 1);
	physics_apply_impulse(x, y, 0, 0)
	alarm_set(0, room_speed * 0.4)
}

if dodgeCooldown > 0
{
	dodgeCooldown -= 1;	
}