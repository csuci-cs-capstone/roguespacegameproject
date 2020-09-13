// behavior_idle		Enemy will not move
// behavior_wander		Enemy will move to a random location
// behavior_pursue		Enemy will pursue the player
// behavior_orbit		Enemy will orbit around the player
// behavior_flank		Enemy will move to a random direction from the player
// behavior_dash		Enemy will dash towards a direction
// behavior_teleport	Enemy will teleport to a random location
// behavior_avoid		Enemy will move away from the player

// @function	function behavior_idle();
function behavior_idle(){
	phy_linear_damping = 5;
}

// @function	function behavior_wander();
function behavior_wander(){
	phy_linear_damping = 2;
	var forceVector = physics_pathfind(myPath, obj_grid.grid, enginePower, phy_position_x, phy_position_y, obj_player.phy_position_x, obj_player.phy_position_y);
}

// @function	function behavior_pursue();
function behavior_pursue(){
	phy_linear_damping = 2;
	var forceVector = physics_pathfind(myPath, obj_grid.grid, enginePower, phy_position_x, phy_position_y, obj_player.phy_position_x, obj_player.phy_position_y);
	physics_apply_force(phy_position_x, phy_position_y, forceVector[0], forceVector[1]);
}