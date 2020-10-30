/// @description Insert description here
// You can write your code in this editor

global.particleSystem = part_system_create();

global.exhaustParticleEmitter = part_emitter_create(global.particleSystem);
global.gunFlashParticleEmitter = part_emitter_create(global.particleSystem);
global.projectileTrailEmitter = part_emitter_create(global.particleSystem);
global.jumpChargeEmitter = part_emitter_create(global.particleSystem);

global.exhaustParticle = part_type_create();
part_type_shape(global.exhaustParticle, pt_shape_spark);
part_type_color3(global.exhaustParticle, c_blue, c_white, c_red);
part_type_alpha2(global.exhaustParticle, 1, 0)
part_type_speed(global.exhaustParticle, 5, 10, -1, 0);
part_type_life(global.exhaustParticle, room_speed/12, room_speed/10);
part_type_scale(global.exhaustParticle, 0.1, 0.1);

global.gunFlashParticle = part_type_create();
part_type_shape(global.gunFlashParticle, pt_shape_spark);
part_type_color2(global.gunFlashParticle, make_color_rgb(255, 192, 192), c_red);
part_type_speed(global.gunFlashParticle, 4, 6, -2, 0);
part_type_alpha2(global.gunFlashParticle, 1, 0)
part_type_life(global.gunFlashParticle, room_speed/10, room_speed/5);
part_type_scale(global.gunFlashParticle, 0.1, 0.1);

global.bulletTrail = part_type_create();
part_type_shape(global.bulletTrail, pt_shape_disk);
part_type_color1(global.bulletTrail, c_red);
part_type_speed(global.bulletTrail, 5, 8, -2, 0);
part_type_alpha2(global.bulletTrail, 1, 0)
part_type_life(global.bulletTrail, room_speed/15, room_speed/14);
part_type_scale(global.bulletTrail, 0.1, 0.1);
part_type_size(global.bulletTrail, 1, 1, -0.2, 0);

global.jumpParticle = part_type_create();
part_type_shape(global.jumpParticle, pt_shape_smoke);
part_type_color2(global.jumpParticle, c_blue, c_white);
part_type_speed(global.jumpParticle, 1, 2, 0.5, 0);
part_type_alpha3(global.jumpParticle, 0, 1, 0)
part_type_life(global.jumpParticle, room_speed/4, room_speed/5);
part_type_scale(global.jumpParticle, 0.1, 0.1);
part_type_size(global.jumpParticle, 1, 1, 0.05, 0);
