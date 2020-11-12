/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

enginePower = 100;

accuracy = 20;
weapon = obj_mine;
danger = 2;

maxHealth = 20;
currentHealth = maxHealth;

destGenX = room_width/2
destGenY = room_height/2
state = behaviorStates.calcDestR
radius = 500
destination = [-1, -1];

value = 3
alarm_set(0, room_speed*2);