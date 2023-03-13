/// @description Orientation manager

//if no orientation change just exit...
if display_get_orientation() == LAST_ORIENTATION then exit; 

//...else update
if display_get_orientation() == display_portrait or display_get_orientation() == display_portrait_flipped
{
	global.orientation_changed = true; //will trigger o_tile
	V_ORIENTATION = true;
	set_resolution(desing_value, false, V_ORIENTATION, true, .5);
	alarm[1] = 1;
}
else if display_get_orientation() == display_landscape or display_get_orientation() == display_landscape_flipped
{
	global.orientation_changed = true; //will trigger o_tile
	V_ORIENTATION = false;
	set_resolution(desing_value, true, V_ORIENTATION, true, .5);
	alarm[1] = 1;
}

