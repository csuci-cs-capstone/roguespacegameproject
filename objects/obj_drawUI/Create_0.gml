/// @description Insert description here
// You can write your code in this editor

display_set_gui_size(640,360)
draw_set_font(fnt_thin8Bit)
draw_set_halign(fa_left);
invSurface = 0;
invScroll = 0;
invHeight = 0;
infoSurface = 0;
infoScroll = 0;
infoHeight = 0;
carriedItem = 0;
carriedItemIndex = -1;
menuMode = 0
equipMode = 0
pressedX = 0
pressedY = 0
infoIndex = 0
jumpDirection = 0;

doNotDisable = false;
fromEquipment = false;

menuOpen = false;
hideUI = false;
alarm_value = -1;

window_set_cursor(cr_none);

//cursor_sprite = spr_crosshairCursor;

//show_debug_overlay(true);