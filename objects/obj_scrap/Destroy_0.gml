/// @description Insert description here
// You can write your code in this editor



switch (image_index)
{
	case 0:
		obj_player.money++;
		audio_play_sound(snd_getScrap1, 8, false);
		break;
	case 1:
		obj_player.money += 5;
		audio_play_sound(snd_getScrap1, 8, false);
		break;
		
	case 2:
		obj_player.money += 10;
		audio_play_sound(snd_getScrap2, 8, false);
		break;
		
	case 3:
		obj_player.money += 25;
		audio_play_sound(snd_getScrap2, 8, false);
		break;
		
	case 4:
		obj_player.money += 50;
		audio_play_sound(snd_getScrap3, 8, false);
		break;
}