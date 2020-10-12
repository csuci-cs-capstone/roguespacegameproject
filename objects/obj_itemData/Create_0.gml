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

enum effectTypes
{
	multiplier,
	additive,
	modify
}

function Effect(_stat, _type, _value) constructor
{
	stat = _stat
	type = _type
	value = _value
}

function Item(_name, _spr, _rarity, _itemType, _description, _effects) constructor
{
	name = _name
	itemSprite = _spr
	type = _itemType
	description = _description
	effects = _effects
}

itemList = ds_list_create()
	
test_item = new Item("test", 
					spr_testItem, 
					itemTypes.otherItem, 
					"An item for testing, do not eat.", 
					[]);

ds_list_add(itemList, test_item);

basic_hull = new Item("Basic Hull", 
					spr_testItem, 
					itemTypes.otherItem, 
					"Basic hull made out of average high-strength carbon material", 
					[new Effect("hullStat", effectTypes.modify, 100)]);
					
ds_list_add(itemList, basic_hull);

basic_armor = new Item("Titanium Armor", 
					spr_testItem, 
					itemTypes.otherItem, 
					"Common armor comprised of ultra-dense titanium-carbide alloy", 
					[new Effect("armorStat", effectTypes.modify, 5)]);
					
ds_list_add(itemList, basic_armor);

basic_shields = new Item("Standard Shields", 
					spr_testItem, 
					itemTypes.otherItem, 
					"Basic flash charge ion-particle sheilding", 
					[new Effect("shieldStat", effectTypes.modify, 3)]);
					
ds_list_add(itemList, basic_shields);

basic_engine = new Item("Ion Engine", 
					spr_testItem, 
					itemTypes.otherItem, 
					"Ion propulsion common among civilian spaceships due to its low cost", 
					[new Effect("engineStat", effectTypes.modify, 300)]);
					
ds_list_add(itemList, basic_engine);

basic_weapon = new Item("Plasma Blasters", 
					spr_testItem, 
					itemTypes.otherItem, 
					"A popular choice for travellers who want some level of defence", 
					[]);
					
ds_list_add(itemList, basic_weapon);

basic_special = new Item("Overdrive Boosters", 
					spr_testItem, 
					itemTypes.otherItem, 
					"Allows pilots and captains to dramatically maneuver around threats by instantly applying force in a specific direction. G-force dampeners recommended", 
					[]);
					
ds_list_add(itemList, basic_special);