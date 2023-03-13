/// @description Window change size handling

if room == rm_init then exit;

// make sure it will be remembered the last window size before going fullscreen, so the window size will be preserved 
if not window_get_fullscreen() 
{
	scale_w = window_get_width() / WIDTH;
	scale_h = window_get_height() / HEIGHT;
} 


//If horizontal (width) window size change detected...
if last_w != window_get_width() 
{
	show_debug_message("w resize");
	set_resolution(DESIGN_WIDTH, false, false, true,  scale_w);
	alarm[1] = 1; // delay action, just in case the user switch to or from fullscreen 

}
//If vertical (height) window size change detected...
else if last_h != window_get_height() 
{
	show_debug_message("h resize");
	set_resolution(DESIGN_WIDTH, false, false, true,  scale_h);
	alarm[1] = 1; // delay action, just in case the user switch to or from fullscreen
}