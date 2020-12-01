// @function	attack_basic()
function attack_basic()
{
	if !dodging && canShoot && canSee
	{
		canShoot = false;
		audio_stop_sound(snd_enemyFire)
		audio_play_sound(snd_enemyFire, 0, false);
		var projectileDirection = -phy_rotation + random_range(-accuracy, accuracy);
		
		var projectile = instance_create_layer(phy_position_x, phy_position_y, "Interactible", weapon);
		
		projectile.phy_speed_x = lengthdir_x(10, projectileDirection) + phy_speed_x;
		projectile.phy_speed_y = lengthdir_y(10, projectileDirection) + phy_speed_y;
		
		alarm_set(0, room_speed);	
	}
}

// @function	attack_spread()
function attack_spread()
{
	if !dodging && canShoot && canSee
	{
		canShoot = false;
		audio_stop_sound(snd_enemyFire)
		audio_play_sound(snd_enemyFire, 0, false);
		var i, projectileDirection;
		
		for (i = 0; i < 5; i++)
		{
			projectileDirection = -phy_rotation + ((15 * i) - 30);
		
			var projectile = instance_create_layer(phy_position_x, phy_position_y, "Interactible", weapon);
		
			projectile.phy_speed_x = lengthdir_x(6, projectileDirection) + phy_speed_x;
			projectile.phy_speed_y = lengthdir_y(6, projectileDirection) + phy_speed_y;
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
	if !dodging && canShoot && canSee
	{
		if count < 3
		{
			canShoot = false;
			audio_stop_sound(snd_enemyFire)
			audio_play_sound(snd_enemyFire, 0, false);
			
			var projectileDirection = -phy_rotation + random_range(-accuracy, accuracy);
		
			var projectile = instance_create_layer(phy_position_x, phy_position_y, "Interactible", weapon);
		
			projectile.phy_speed_x = lengthdir_x(12, projectileDirection) + phy_speed_x;
			projectile.phy_speed_y = lengthdir_y(12, projectileDirection) + phy_speed_y;
			projectile.phy_rotation = phy_rotation
			
			count++;
			if count < 3
			{
				alarm_set(0, room_speed / 7)
			}
		}
		alarm_set(4, room_speed);	
	}
}

// @function	attack_burst5()
function attack_burst5()
{
	if !dodging && canShoot && canSee
	{
		if count < 5
		{
			canShoot = false;
			audio_stop_sound(snd_enemyFire)
			audio_play_sound(snd_enemyFire, 0, false);
			
			var projectileDirection = -phy_rotation + random_range(-accuracy, accuracy);
		
			var projectile = instance_create_layer(phy_position_x, phy_position_y, "Interactible", weapon);
		
			projectile.phy_speed_x = lengthdir_x(12, projectileDirection) + phy_speed_x;
			projectile.phy_speed_y = lengthdir_y(12, projectileDirection) + phy_speed_y;
			projectile.phy_rotation = phy_rotation
			
			count++;
			if count < 5
			{
				alarm_set(0, room_speed / 7)
			}
		}
		alarm_set(4, room_speed);	
	}
}

// @function	attack_sniper()
function attack_beam()
{
	
}

// @function	attack_360()
function attack_360()
{
	
}

function swarm_missile()
{
	if !dodging && canShoot && canSee
	{
		if count < 10
		{
			canShoot = false;
			audio_stop_sound(snd_missileFire2)
			audio_stop_sound(snd_enemyFire)
			audio_play_sound(snd_missileFire2, 1, false)
			audio_play_sound(snd_enemyFire, 1, false)
			
			var projectileDirection = -phy_rotation + random_range(-accuracy, accuracy);
		
			var projectile = instance_create_layer(phy_position_x, phy_position_y, "Interactible", weapon);
		
			projectile.phy_speed_x = lengthdir_x(2, projectileDirection) + phy_speed_x;
			projectile.phy_speed_y = lengthdir_y(2, projectileDirection) + phy_speed_y;
			projectile.phy_rotation = phy_rotation
			
			count++;
			if count < 10
			{
				alarm_set(0, room_speed / 12)
			}
		}
		alarm_set(4, room_speed * 5);	
	}
}

function lay_mine()
{
	if !dodging && canShoot
	{
		canShoot = false;
		audio_stop_sound(snd_enemyFire)
		audio_play_sound(snd_enemyFire, 0, false);
		
		instance_create_layer(phy_position_x, phy_position_y, "Interactible", weapon);
		
		alarm_set(0, room_speed*2);	
	}
}

// @function	attack_sniper()
function attack_sniper()
{
	if !dodging && canShoot && canSee
	{
		canShoot = false;
		audio_stop_sound(snd_sniperFire)
		audio_play_sound(snd_sniperFire, 0, false);
		
		physics_apply_impulse(phy_position_x, phy_position_y, lengthdir_x(150, -phy_rotation + 180) , lengthdir_y(150, -phy_rotation + 180));
		
		var projectileDirection = -phy_rotation;
		var projectile = instance_create_layer(phy_position_x, phy_position_y, "Interactible", weapon);
		projectile.phy_speed_x = lengthdir_x(35, projectileDirection) + phy_speed_x;
		projectile.phy_speed_y = lengthdir_y(35, projectileDirection) + phy_speed_y;
		projectile.phy_rotation = phy_rotation
		projectile.initialX = phy_position_x;
		projectile.initialY = phy_position_y;
	}
}