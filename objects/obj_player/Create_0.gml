/// @description Initial Variables
// You can write your code in this editor

#region // Custom Fixture
var fix = physics_fixture_create();
physics_fixture_set_polygon_shape(fix);
physics_fixture_add_point(fix, 12, 0);
physics_fixture_add_point(fix, -7, 10);
physics_fixture_add_point(fix, -12, 0);
physics_fixture_add_point(fix, -7, -10);
physics_fixture_set_density(fix,1);
physics_fixture_set_restitution(fix,0.2)
physics_fixture_set_linear_damping(fix,4);
physics_fixture_set_angular_damping(fix,8);
physics_fixture_set_friction(fix,0.4);
physics_fixture_set_collision_group(fix,1);
myFix = physics_fixture_bind(fix,id);
physics_fixture_delete(fix);
#endregion

inventory = ds_list_create()

#region // Stats
stats = ds_map_create();
ds_map_add(stats, "hullStat", 0);
ds_map_add(stats, "armorStat", 0);
ds_map_add(stats, "shieldStat", 0);
ds_map_add(stats, "shieldRechargeStat", 0)
ds_map_add(stats, "engineStat", 0);
ds_map_add(stats, "dodgeSpeedMultStat", 0);
ds_map_add(stats, "dodgeRechargeStat", 0);
ds_map_add(stats, "damageStat", 0);
ds_map_add(stats, "projectileSpeedStat", 0);
ds_map_add(stats, "projectileWeightStat", 0);
ds_map_add(stats, "firerateStat", 0);
ds_map_add(stats, "accuracyStat", 0);
#endregion

#region // Additive Modifiers
additives = ds_map_create();
ds_map_add(additives, "hullStat", 0);
ds_map_add(additives, "armorStat", 0);
ds_map_add(additives, "shieldStat", 0);
ds_map_add(additives, "shieldRechargeStat", 0)
ds_map_add(additives, "engineStat", 0);
ds_map_add(additives, "dodgeSpeedMultStat", 0);
ds_map_add(additives, "dodgeRechargeStat", 0);
ds_map_add(additives, "damageStat", 0);
ds_map_add(additives, "projectileSpeedStat", 0);
ds_map_add(additives, "projectileWeightStat", 0);
ds_map_add(additives, "firerateStat", 0);
ds_map_add(additives, "accuracyStat", 0);
#endregion

#region // Modifiers
modifiers = ds_map_create();
ds_map_add(modifiers, "hullStat", 1);
ds_map_add(modifiers, "armorStat", 1);
ds_map_add(modifiers, "shieldStat", 1);
ds_map_add(modifiers, "shieldRechargeStat", 1)
ds_map_add(modifiers, "engineStat", 1);
ds_map_add(modifiers, "dodgeSpeedMultStat", 1);
ds_map_add(modifiers, "dodgeRechargeStat", 1);
ds_map_add(modifiers, "damageStat", 1);
ds_map_add(modifiers, "projectileSpeedStat", 1);
ds_map_add(modifiers, "projectileWeightStat", 1);
ds_map_add(modifiers, "firerateStat", 1);
ds_map_add(modifiers, "accuracyStat", 1);
#endregion

#region // EquipSlots
equipped = ds_map_create();
ds_map_add(equipped, "hullSlot", 0)
ds_map_add(equipped, "armorSlot", 0)
ds_map_add(equipped, "shieldSlot", 0)
ds_map_add(equipped, "engineSlot", 0)
ds_map_add(equipped, "specialSlot", 0)
ds_map_add(equipped, "basicWeaponSlot", 0)
ds_map_add(equipped, "missileWeaponSlot", 0)
ds_map_add(equipped, "areaWeaponSlot", 0)
ds_map_add(equipped, "tractorWeaponSlot", 0)
#endregion

#region //equipping default weapons
add_item(obj_itemData.basic_hull);
equip_item(0, "hullSlot");

add_item(obj_itemData.basic_armor);
equip_item(0, "armorSlot");

add_item(obj_itemData.basic_shields);
equip_item(0, "shieldSlot");

add_item(obj_itemData.basic_engine);
equip_item(0, "engineSlot");

add_item(obj_itemData.basic_special);
equip_item(0, "specialSlot");

add_item(obj_itemData.basic_weapon);
equip_item(0, "basicWeaponSlot");

#endregion

currentShields = get_stat("shieldStat");
currentHealth = get_stat("hullStat");
description = "Your ship, it has seen a few battles."
money = 0;

depth = 0;
image_speed = 0;
rotationSpeed = 20;

#region // Dodge variable stuff
dodgeCooldown = 0;
dodge = false;
dodging = false;
#endregion

// Placement of Weapons
hardpointLeft = [-8, -3];
hardpointRight = [8, -3];
//

leftWeapon = instance_create_layer(0, 0, "Interactible", obj_leftWeapon);
leftWeapon.sprite_index = equipped[? "basicWeaponSlot"].equipSprite

rightWeapon = instance_create_layer(0, 0, "Interactible", obj_rightWeapon);
rightWeapon.sprite_index = equipped[? "basicWeaponSlot"].equipSprite

// 

flash = 0

alarm_set(1, room_speed);

phy_fixed_rotation = true; // rotation will not be affected by physics

// Variables needed for collision damage calculation

previousSpeed1 = 0;
previousSpeed2 = 0;
i = true;

speedChange = 0;

playerControlsEnabled = true

canRecharge = true;

shieldAlpha = 0;

playHitSound = true;

// weapon stuff
side = false

alarm_set(3, room_speed * (1 / (get_stat("firerateStat") * 2)));

move_wrap(true, true, 0)