/// @description Insert description here
// You can write your code in this editor

x = 0
y = 0

var boundary = physics_fixture_create();
physics_fixture_set_chain_shape(boundary, true);
physics_fixture_add_point(boundary,    0,   0);
physics_fixture_add_point(boundary, room_width - 1,   0);
physics_fixture_add_point(boundary, room_width - 1, room_height - 1);
physics_fixture_add_point(boundary,    0, room_height - 1);
physics_fixture_bind(boundary, id);
physics_fixture_delete(boundary);