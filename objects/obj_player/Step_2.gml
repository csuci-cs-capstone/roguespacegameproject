/// @description Insert description here
// You can write your code in this editor

if !obj_jumpMechanics.jump && !dodging && (upKey || downKey || leftKey || rightKey)
{
	part_emitter_region(global.particleSystem, global.exhaustParticleEmitter, 
						player_coordintes_respect_to_world_x(-3, -5),
						player_coordintes_respect_to_world_x(3, -6),
						player_coordintes_respect_to_world_y(-3, -5),
						player_coordintes_respect_to_world_y(3, -6),
						ps_shape_ellipse, ps_distr_gaussian);
			
	part_type_direction(global.exhaustParticle, (-obj_player.phy_rotation + 180) - 10, (-obj_player.phy_rotation + 180) + 10, 0, 0);
			
	part_emitter_burst(global.particleSystem, global.exhaustParticleEmitter, global.exhaustParticle, 5);
}

if obj_drawUI.alarm_value != -1
{
	
}