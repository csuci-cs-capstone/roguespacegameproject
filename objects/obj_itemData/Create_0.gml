/// @description Insert description here
// You can write your code in this editor

function Item(_name, _spr, _rarity, _health, _armor, _shield, _movementSpeed, _dodgeSpeed, _dodgeRecharge, _weaponAttackMult, _weaponFirerate, _description) constructor
{
	name = _name
	itemSprite = _spr
	healthEffect = _health;
	armorEffect = _armor;
	shieldEffect = _shield;
	movementSpeedEffect = _movementSpeed;
	dodgeSpeedEffect = _dodgeSpeed;
	dodgechargeEffect = _dodgeRecharge;
	weaponAttackMultEffect = _weaponAttackMult;
	weaponFirerateEffect = _weaponFirerate;
	description = _description;
}
	
test_item = new Item("test", spr_testItem, 100, 50, 50, 50, 50, 50, 50, 50, 50, "An item for testing, do not eat.");