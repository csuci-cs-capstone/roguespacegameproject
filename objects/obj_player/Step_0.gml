/// @description Movement
// You can write your code in this editor

// Smooth Rotation

theta = point_direction(phy_position_x, phy_position_y, mouse_x, mouse_y);

//phy_rotation = -theta;
//physics_apply_torque((sin(degtorad(-phy_rotation - theta)) * rotationSpeed));

phy_rotation += sin(degtorad(-phy_rotation - theta)) * rotationSpeed;

//

if !dodging
{
	if upKey || downKey || leftKey || rightKey
	{
		phy_linear_damping = 1
		if upKey
		{
			physics_apply_force(x, y, 0, -enginePower);
		}
		if downKey
		{
			physics_apply_force(x, y, 0, enginePower);
		}
		if leftKey
		{
			physics_apply_force(x, y, -enginePower, 0);
		}
		if rightKey
		{
			physics_apply_force(x, y, enginePower, 0);
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
	
	physics_remove_fixture(id, myFix);
	
	var newFix = physics_fixture_create()
	physics_fixture_set_polygon_shape(newFix)
	physics_fixture_add_point(newFix, 49.9972, 21)
	physics_fixture_add_point(newFix, 11, 39.56863)
	physics_fixture_add_point(newFix, 2.300925, 21)
	physics_fixture_add_point(newFix, 10.9832, 2.271708)
	physics_set_density(newFix,0.5)
	physics_set_restitution(newFix,0.1)
	physics_fixture_set_linear_damping(newFix,2)
	physics_fixture_set_angular_damping(newFix,4)
	physics_set_friction(newFix,0.2)
	physics_fixture_set_collision_group(newFix,-1)
	myFix = physics_fixture_bind(newFix,id)
	physics_fixture_delete(newFix);
	
	var upDown = 0;
	var leftRight = 0;
	
	if upKey
	{
		upDown -= 1;
	}
	if downKey
	{
		upDown += 1;
	}
	if leftKey
	{
		leftRight -= 1;
	}
	if rightKey
	{
		leftRight += 1;
	}
	
	var dodgeDirection = point_direction(0, 0, leftRight, upDown);
	
	physics_apply_impulse(x, y, lengthdir_x(enginePower, dodgeDirection) , lengthdir_y(enginePower, dodgeDirection));
	
	image_speed = (phy_speed != 0 ? sign(-phy_speed_x) : 1);
	physics_apply_impulse(x, y, 0, 0)
	alarm_set(0, room_speed * 0.4)
}

if dodgeCooldown > 0
{
	dodgeCooldown -= 1;	
}