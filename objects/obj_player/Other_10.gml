/// @description Insert description here
// You can write your code in this editor

switch(weaponIndex)
{
	case 0:
		if is_struct(equipped[? "basicWeaponSlot"])
		{
			remove_effect(currentWeapon)
			currentWeapon = equipped[? "basicWeaponSlot"]
			apply_effect(currentWeapon)
			
			leftWeapon.sprite_index = currentWeapon.equipSprite
			rightWeapon.sprite_index = currentWeapon.equipSprite
		}
		break;
	case 1:
		if is_struct(equipped[? "missileWeaponSlot"])
		{
			remove_effect(currentWeapon)
			currentWeapon = equipped[? "missileWeaponSlot"]
			apply_effect(currentWeapon)
			
			leftWeapon.sprite_index = currentWeapon.equipSprite
			rightWeapon.sprite_index = currentWeapon.equipSprite
		}
		break;
	case 2:
		if is_struct(equipped[? "areaWeaponSlot"])
		{
			remove_effect(currentWeapon)
			currentWeapon = equipped[? "areaWeaponSlot"]
			apply_effect(currentWeapon)
			
			leftWeapon.sprite_index = currentWeapon.equipSprite
			rightWeapon.sprite_index = currentWeapon.equipSprite
		}
		break;
	case 3:
		if is_struct(equipped[? "tractorWeaponSlot"])
		{
			remove_effect(currentWeapon)
			currentWeapon = equipped[? "tractorWeaponSlot"]
			apply_effect(currentWeapon)
			
			leftWeapon.sprite_index = currentWeapon.equipSprite
			rightWeapon.sprite_index = currentWeapon.equipSprite
		}
		break;
}
