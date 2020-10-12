/// @description Insert description here
// You can write your code in this editor

enum itemTypes
{
	armorItem,
	shieldItem,
	engineItem,
	weaponItem,
	specialItem,
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

function Item(_name, _spr, _rarity, _description) constructor
{
	name = _name
	itemSprite = _spr
	rarity = _rarity
	description = _description
	effects = []
}
	
test_item = new Item("test", spr_testItem, 100, "An item for testing, do not eat.", [new Effect()]);