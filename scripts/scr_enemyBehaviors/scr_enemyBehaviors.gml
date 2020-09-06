// behavior_idle	Enemy will not move
// behavior_wander	Enemy will move in random directions
// behavior_drift	Enemy will drift around
// behavior_pursue	Enemy will pursue the player
// behavior_orbit	Enemy will orbit around the player
// behavior_flank	Enemy will move to a random direction from the player
// behavior_dash	Enemy will dash towards a direction
// behavior_jump	Enemy will jump to a random location
// behavior_avoid	Enemy will move away from the player

// @function
// @param
function behavior_idle(){
	phy_linear_damping = 10;
}