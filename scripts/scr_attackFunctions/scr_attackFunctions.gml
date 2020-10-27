// @function	attack_basic()
function attack_basic()
{
	if !dodging && canShoot && canSee
	{
		canShoot = false;
		
		var projectileDirection = -phy_rotation + random_range(-accuracy, accuracy);
		
		var projectile = instance_create_layer(phy_position_x, phy_position_y, "Interactible", weapon);
		
		projectile.phy_speed_x = lengthdir_x(20, projectileDirection) + phy_speed_x;
		projectile.phy_speed_y = lengthdir_y(20, projectileDirection) + phy_speed_y;
		
		alarm_set(0, room_speed);	
	}
}

// @function	attack_spread()
function attack_spread()
{
	if !dodging && canShoot && canSee
	{
		canShoot = false;
		
		var i, projectileDirection;
		
		for (i = 0; i < 5; i++)
		{
			projectileDirection = -phy_rotation + ((15 * i) - 30);
		
			var projectile = instance_create_layer(phy_position_x, phy_position_y, "Interactible", weapon);
		
			projectile.phy_speed_x = lengthdir_x(5, projectileDirection) + phy_speed_x;
			projectile.phy_speed_y = lengthdir_y(5, projectileDirection) + phy_speed_y;
		}
		
		alarm_set(0, room_speed);	
	}
}

// @function	attack_rapid()
function attack_rapid()
{
	
}

// @function	attack_burst3()
function attack_burst3()
{
	
}

// @function	attack_burst5()
function attack_burst5()
{
	
}

// @function	attack_360()
function attack_360()
{
	
}

// @function	attack_sniper()
function attack_sniper()
{
	
}