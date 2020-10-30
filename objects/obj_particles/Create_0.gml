/// @description Insert description here
// You can write your code in this editor

global.particleSystem = part_system_create();

global.exhaustParticleEmitter = part_emitter_create(global.particleSystem);

global.exhaustParticle = part_type_create();
part_type_shape(global.exhaustParticle, pt_shape_smoke);