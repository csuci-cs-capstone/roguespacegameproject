/// @description Insert description here
// You can write your code in this editor

event_inherited()

depth = -3

bigGun = instance_create_layer(x, y, "Interactible", obj_Boss_Cannon);

shotGun = instance_create_layer(x, y, "Interactible", obj_Boss_Shotgun);
shotGun.angleOffset = -25;

rapid1 = instance_create_layer(x, y, "Interactible", obj_Boss_Rapid);

rapid2 = instance_create_layer(x, y, "Interactible", obj_Boss_Rapid);