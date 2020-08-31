/// @description Insert description here
// You can write your code in this editor

instance_create_layer(random_range(300, room_width - 300), random_range(300, room_height - 300), "Interactible", choose(obj_enemyBoringNormal, obj_enemySpinAround, obj_enemyAimless));
numberOfEnemies++;

if (numberOfEnemies < maxNumberOfEnemies)
{
	alarm_set(0, room_speed * 1);
}