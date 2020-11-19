/// @description Insert description here
// You can write your code in this editor

#region //enums
enum itemTypes
{
	hullItem,
	armorItem,
	shieldItem,
	engineItem,
	weaponItem,
	specialItem,
	passiveItem,
	questItem,
	otherItem
}

enum weaponTypes
{
	notAWeapon,
	basic,
	missile,
	area,
	tractor
}

enum effectTypes
{
	multiplier,
	modify
}

enum firingPatterns
{
	notAWeapon,
	unison,
	alternate,
	burstUnison,
	burstAlternate,
	charge,
	burstCharge,
	stream
}

enum targetModes
{
	doesNotTarget,
	enemies,
	enemiesAndObstacles,
	enemiesObstaclesAndDestroyableWeapons
}
#endregion

#region //structs
Effect = function(_stat, _type, _value) constructor
{
	stat = _stat
	effectType = _type
	effectValue = _value
}

Item = function(_name, _spr, _itemType, _weaponType, _description, _value, _effects, _sprite, _projectile, _firePattern, _targetable) constructor
{
	name = _name
	itemSprite = _spr
	itemType = _itemType
	weaponType = _weaponType
	description = _description
	value = _value
	effects = _effects
	equipSprite = _sprite
	projectile = _projectile
	firePattern = _firePattern
	targetMode = _targetable;
}
#endregion

#region //items
itemList = ds_list_create()
	
test_item = new Item("test", 
					spr_testItem, 
					itemTypes.otherItem,
					weaponTypes.notAWeapon,
					"An item for testing, do not eat.",
					1000000,
					[],
					spr_testItem,
					0,
					firingPatterns.notAWeapon,
					targetModes.doesNotTarget);

ds_list_add(itemList, test_item);

basic_hull = new Item("Basic Hull", 
					spr_basicHull, 
					itemTypes.hullItem, 
					weaponTypes.notAWeapon,
					"Basic hull made out of average high-strength carbon material",
					10,
					[new Effect("hullStat", effectTypes.modify, 100)],
					spr_testItem,
					0,
					firingPatterns.notAWeapon,
					targetModes.doesNotTarget);
					
ds_list_add(itemList, basic_hull);

basic_armor = new Item("Titanium Armor", 
					spr_basicArmor, 
					itemTypes.armorItem, 
					weaponTypes.notAWeapon,
					"Common armor comprised of ultra-dense titanium-carbide alloy", 
					10,
					[new Effect("armorStat", effectTypes.modify, 5)],
					spr_testItem,
					0,
					firingPatterns.notAWeapon,
					targetModes.doesNotTarget);
					
ds_list_add(itemList, basic_armor);

basic_shields = new Item("Standard Shields", 
					spr_basicShields, 
					itemTypes.shieldItem, 
					weaponTypes.notAWeapon,
					"Basic flash charge ion-particle sheilding", 
					10,
					[new Effect("shieldStat", effectTypes.modify, 100),
					new Effect("shieldRechargeStat", effectTypes.modify, 0.075)],
					spr_testItem,
					0,
					firingPatterns.notAWeapon,
					targetModes.doesNotTarget);
					
ds_list_add(itemList, basic_shields);

basic_engine = new Item("Ion Engine", 
					spr_basicEngine, 
					itemTypes.engineItem, 
					weaponTypes.notAWeapon,
					"Ion propulsion common among civilian spaceships due to its low cost", 
					10,
					[new Effect("engineStat", effectTypes.modify, 80)],
					spr_testItem,
					0,
					firingPatterns.notAWeapon,
					targetModes.doesNotTarget);
					
ds_list_add(itemList, basic_engine);

basic_special = new Item("Overdrive Boosters", 
					spr_basicSpecial, 
					itemTypes.specialItem, 
					weaponTypes.notAWeapon,
					"Allows pilots and captains to dramatically maneuver around threats by instantly applying force in a specific direction. G-force dampeners recommended", 
					50,
					[new Effect("dodgeSpeedMultStat", effectTypes.modify, 1.1), 
					new Effect("dodgeRechargeStat", effectTypes.modify, 5)],
					spr_testItem,
					0,
					firingPatterns.notAWeapon,
					targetModes.doesNotTarget);
					
ds_list_add(itemList, basic_special);
#endregion

#region //weapons
basic_weapon = new Item("Plasma Blasters", 
					spr_basicWeaponIcon, 
					itemTypes.weaponItem, 
					weaponTypes.basic,
					"Basic energy weapons, very common in the universe.", 
					25,
					[new Effect("damageStat", effectTypes.modify, 10),
					new Effect("projectileSpeedStat", effectTypes.modify, 15),
					new Effect("projectileWeightStat", effectTypes.modify, 0.01),
					new Effect("firerateStat", effectTypes.modify, 10),
					new Effect("accuracyStat", effectTypes.modify, 1)],
					spr_basicWeapon,
					obj_basicProjectile,
					firingPatterns.alternate,
					targetModes.doesNotTarget);
					
ds_list_add(itemList, basic_weapon);

basic_missile = new Item("Homing Missiles", 
					spr_basicMissileIcon, 
					itemTypes.weaponItem, 
					weaponTypes.missile,
					"Missiles that blindly seeks a targeted enemy, or any closest enemy if no target is chosen.", 
					25,
					[new Effect("damageStat", effectTypes.modify, 20),
					new Effect("projectileSpeedStat", effectTypes.modify, 10),
					new Effect("projectileWeightStat", effectTypes.modify, 0.5),
					new Effect("firerateStat", effectTypes.modify, 0.5),
					new Effect("accuracyStat", effectTypes.modify, 0)],
					spr_missileWeapon,
					obj_basicMissile,
					firingPatterns.unison,
					targetModes.enemies);
					
ds_list_add(itemList, basic_missile);

basic_area = new Item("Wave Launcher", 
					spr_basicAreaIcon, 
					itemTypes.weaponItem, 
					weaponTypes.area,
					"Launches an energy pulse that pushes away and damages enemies and obstacles.", 
					25,
					[new Effect("damageStat", effectTypes.modify, 5),
					new Effect("projectileSpeedStat", effectTypes.modify, 15),
					new Effect("projectileWeightStat", effectTypes.modify, 0.5),
					new Effect("firerateStat", effectTypes.modify, 1.5),
					new Effect("accuracyStat", effectTypes.modify, 0),
					new Effect("chargeTimeStat", effectTypes.modify, 0.75),
					new Effect("pulseLifetimeStat", effectTypes.modify, 1.5)],
					spr_areaWeapon,
					obj_waveProjectile,
					firingPatterns.charge,
					targetModes.doesNotTarget);
					
ds_list_add(itemList, basic_area);

basic_tractor = new Item("Tractor Beam", 
					spr_basicTractorIcon, 
					itemTypes.weaponItem, 
					weaponTypes.missile,
					"Beams that take hold of objects and allows the user to move them around, assuming they have the mass and thrust to do so.", 
					25,
					[new Effect("damageStat", effectTypes.modify, 0),
					new Effect("projectileSpeedStat", effectTypes.modify, 10),
					new Effect("projectileWeightStat", effectTypes.modify, 0.5),
					new Effect("firerateStat", effectTypes.modify, 0),
					new Effect("accuracyStat", effectTypes.modify, 0)],
					spr_tractorWeapon,
					obj_basicProjectile,
					firingPatterns.stream,
					targetModes.enemiesObstaclesAndDestroyableWeapons);
					
ds_list_add(itemList, basic_tractor);
#endregion