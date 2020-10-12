/// @description Initial Variables
// You can write your code in this editor

#region // Custom Fixture
var fix = physics_fixture_create();
physics_fixture_set_polygon_shape(fix);
physics_fixture_add_point(fix, 12, 0);
physics_fixture_add_point(fix, -7, 10);
physics_fixture_add_point(fix, -12, 0);
physics_fixture_add_point(fix, -7, -10);
physics_fixture_set_density(fix,0.5);
physics_fixture_set_restitution(fix,0.1)
physics_fixture_set_linear_damping(fix,2);
physics_fixture_set_angular_damping(fix,4);
physics_fixture_set_friction(fix,0.2);
physics_fixture_set_collision_group(fix,1);
myFix = physics_fixture_bind(fix,id);
physics_fixture_delete(fix);
#endregion

#region // Stats
stats = ds_map_create();
ds_map_add(stats, "hullStat", 100);
ds_map_add(stats, "armorStat", 100);
ds_map_add(stats, "shieldStat", 100);
ds_map_add(stats, "engineStat", 300);
ds_map_add(stats, "dodgeSpeedMultStat", 1.2);
ds_map_add(stats, "dodgeRechargeStat", 5);
ds_map_add(stats, "damageStat", 1);
ds_map_add(stats, "projectileSpeed", 1);
ds_map_add(stats, "projectileWeight", 1);
ds_map_add(stats, "firerateStat", 1);
#endregion

equipped = ds_map_create();
ds_map_add(stats, "")

currentHealth = ds_map_find_value(stats, "hullStat");
money = 0;
inventory = ds_list_create()
description = "Your ship, it has seen a few battles."

depth = 0;
image_speed = 0;

rotationSpeed = 20;

// Dodge variable stuff

dodgeCooldown = 0;
dodge = false;
dodging = false;

// Placement of Weapons
hardpointLeft = [-8, -3];
hardpointRight = [8, -3];
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

// Variables needed for collision damage calculation

previousSpeed1 = 0;
previousSpeed2 = 0;
i = true;

speedChange = 0;

