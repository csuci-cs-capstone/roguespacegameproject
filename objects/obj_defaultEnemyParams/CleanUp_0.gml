/// @description Delete Path
// You can write your code in this editor

if path_exists(myPath)
{
	path_delete(myPath);
}

if ds_exists(collisionList, ds_type_list)
{
	ds_list_destroy(collisionList);
}