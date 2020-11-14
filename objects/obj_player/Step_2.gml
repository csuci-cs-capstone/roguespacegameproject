/// @description Insert description here
// You can write your code in this editor

if !obj_jumpMechanics.jump && !dodging && (upKey || downKey || leftKey || rightKey)
{
	part_emitter_region(global.particleSystem, global.exhaustParticleEmitter, 
						coordintes_respect_to_world_x(-3, -5, phy_position_x, phy_rotation),
						coordintes_respect_to_world_x(3, -6, phy_position_x, phy_rotation),
						coordintes_respect_to_world_y(-3, -5, phy_position_y, phy_rotation),
						coordintes_respect_to_world_y(3, -6, phy_position_y, phy_rotation),
						ps_shape_ellipse, ps_distr_gaussian);
			
	part_type_direction(global.exhaustParticle, (-phy_rotation + 180) - 10, (-phy_rotation + 180) + 10, 0, 0);
			
	part_emitter_burst(global.particleSystem, global.exhaustParticleEmitter, global.exhaustParticle, 5);
}

if obj_drawUI.alarm_value != -1
{
	
}