/// @description Look at player and Collision Damage
// You can write your code in this editor

if odd
{
	speed1 = phy_speed;
	odd = false;
}
else
{
	speed2 = phy_speed;
	odd = true;
}

var difference = abs(phy_speed - max(speed1, speed2))

speedChange = difference;
collisionDamage = power(speedChange, 2)

canSee = can_see_player();

clamp(accuracy, 0, 360);

mp_grid_clear_cell(obj_grid.grid, phy_position_x div global.gridSize, phy_position_y div global.gridSize);

if state == behaviorStates.drift
{
	phy_fixed_rotation = false;
}
else
{
	phy_fixed_rotation = true;
	var playerTheta = point_direction(phy_position_x, phy_position_y, obj_player.phy_position_x, obj_player.phy_position_y);
	phy_rotation += sin(degtorad(-phy_rotation - playerTheta)) * rotationSpeed;
}

if currentHealth < 0
{
	instance_destroy();	
}