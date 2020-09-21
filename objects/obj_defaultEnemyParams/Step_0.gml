/// @description Look at player and Collision Damage
// You can write your code in this editor

//

// Obtain previous speed values from the last two steps
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

//

canSee = can_see_player();	// boolean if the enemy has line of sight of player

clamp(accuracy, 0, 360);

mp_grid_clear_cell(obj_grid.grid, phy_position_x div global.gridSize, phy_position_y div global.gridSize); // Make the grid the enemy occupies valid, to reduce the number of invalid path generations

// If the enemi is in a drift state, it will not actively point towards the player, and its rotation will be affected by physics

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

// Destroy enemy if the enemy drops below 0
if currentHealth < 0
{
	instance_destroy();
}

// Movement direction is calculated every step, but movement is applied every step
if state == behaviorStates.attracted || state == behaviorStates.avoid || state == behaviorStates.move || state == behaviorStates.pursue
{
	physics_apply_force(phy_position_x, phy_position_y, lengthdir_x(enginePower, movementDirection), lengthdir_y(enginePower, movementDirection))	
}