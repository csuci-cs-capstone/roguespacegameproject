/// @description Insert description here
// You can write your code in this editor

part_type_destroy(global.exhaustParticle);
part_type_destroy(global.gunFlashParticle);
part_type_destroy(global.bulletTrail);
part_type_destroy(global.jumpParticle);
part_type_destroy(global.fragmentParticle);
part_type_destroy(global.smallerFragmentParticle);

part_emitter_destroy(global.particleSystem, global.exhaustParticleEmitter)
part_emitter_destroy(global.particleSystem, global.gunFlashParticleEmitter)
part_emitter_destroy(global.particleSystem, global.projectileTrailEmitter)
part_emitter_destroy(global.particleSystem, global.jumpChargeEmitter)
part_emitter_destroy(global.particleSystem, global.destroyEmitter)

part_system_destroy(global.particleSystem)