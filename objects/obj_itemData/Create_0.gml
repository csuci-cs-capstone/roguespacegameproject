/// @description Insert description here
// You can write your code in this editor

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
	spread,
	laser,
	rocket,
	burst,
	blast,
	mine
}

enum effectTypes
{
	multiplier,
	additive,
	modify
}

Effect = function(_stat, _type, _value) constructor
{
	stat = _stat
	effectType = _type
	effectValue = _value
}

Item = function(_name, _spr, _itemType, _weaponType, _description, _value, _effects, _sprite, _projectile) constructor
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
}

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
					0);

ds_list_add(itemList, test_item);

basic_hull = new Item("Basic Hull", 
					spr_basicHull, 
					itemTypes.otherItem, 
					weaponTypes.notAWeapon,
					"Basic hull made out of average high-strength carbon material",
					10,
					[new Effect("hullStat", effectTypes.modify, 100)],
					spr_testItem,
					0);
					
ds_list_add(itemList, basic_hull);

basic_armor = new Item("Titanium Armor", 
					spr_basicArmor, 
					itemTypes.otherItem, 
					weaponTypes.notAWeapon,
					"Common armor comprised of ultra-dense titanium-carbide alloy", 
					10,
					[new Effect("armorStat", effectTypes.modify, 5)],
					spr_testItem,
					0);
					
ds_list_add(itemList, basic_armor);

basic_shields = new Item("Standard Shields", 
					spr_basicShields, 
					itemTypes.otherItem, 
					weaponTypes.notAWeapon,
					"Basic flash charge ion-particle sheilding", 
					10,
					[new Effect("shieldStat", effectTypes.modify, 100),
					new Effect("shieldRechargeStat", effectTypes.modify, 0.075)],
					spr_testItem,
					0);
					
ds_list_add(itemList, basic_shields);

basic_engine = new Item("Ion Engine", 
					spr_basicEngine, 
					itemTypes.otherItem, 
					weaponTypes.notAWeapon,
					"Ion propulsion common among civilian spaceships due to its low cost", 
					10,
					[new Effect("engineStat", effectTypes.modify, 100)],
					spr_testItem,
					0);
					
ds_list_add(itemList, basic_engine);

basic_weapon = new Item("Plasma Blasters", 
					spr_basicWeaponIcon, 
					itemTypes.otherItem, 
					weaponTypes.basic,
					"A popular choice for travellers who want some level of defence", 
					25,
					[new Effect("damageStat", effectTypes.modify, 5),
					new Effect("projectileSpeedStat", effectTypes.modify, 6),
					new Effect("projectileWeightStat", effectTypes.modify, 0.01),
					new Effect("firerateStat", effectTypes.modify, 2)],
					spr_basicWeapon,
					obj_basicProjectile);
					
ds_list_add(itemList, basic_weapon);

basic_special = new Item("Overdrive Boosters", 
					spr_basicSpecial, 
					itemTypes.otherItem, 
					weaponTypes.notAWeapon,
					"Allows pilots and captains to dramatically maneuver around threats by instantly applying force in a specific direction. G-force dampeners recommended", 
					50,
					[new Effect("dodgeSpeedMultStat", effectTypes.modify, 1.1), 
					new Effect("dodgeRechargeStat", effectTypes.modify, 5)],
					spr_testItem,
					0);
					
ds_list_add(itemList, basic_special);
#endregion