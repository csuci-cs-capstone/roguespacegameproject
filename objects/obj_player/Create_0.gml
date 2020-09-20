/// @description Initial Variables
// You can write your code in this editor

// Custom Fixture

var fix = physics_fixture_create();
physics_fixture_set_polygon_shape(fix);
physics_fixture_add_point(fix, 24, 0);
physics_fixture_add_point(fix, -13, 20);
physics_fixture_add_point(fix, -24, 0);
physics_fixture_add_point(fix, -13, -20);
physics_fixture_set_density(fix,0.5);
physics_fixture_set_restitution(fix,0.1)
physics_fixture_set_linear_damping(fix,2);
physics_fixture_set_angular_damping(fix,4);
physics_fixture_set_friction(fix,0.2);
physics_fixture_set_collision_group(fix,1);
myFix = physics_fixture_bind(fix,id);
physics_fixture_delete(fix);

//

maxHealth = 100;
currentHealth = maxHealth;

depth = 0;

image_speed = 0;

rotationSpeed = 20;
enginePower = 300;

//

dodgeCooldown = 0;
dodge = false;
dodging = false;

// Placement of Weapons

hardpointLeft = [-13, -12];
hardpointRight = [13, -12];

//

// Creating Weapon Objects

playerWeapon = obj_playerWeapon;

var weapon = instance_create_layer(0, 0, "Interactible", playerWeapon);
weapon.side = 0;

var weapon = instance_create_layer(0, 0, "Interactible", playerWeapon);
weapon.side = 1;

side = 0;

//

flash = 0

alarm_set(1, room_speed);

phy_fixed_rotation = true; // rotation will not be affected by physics

//

speed1 = 0;
speed2 = 0;

speedChange = 0;
collisionDamage = power(speedChange, 2)

odd = true;

