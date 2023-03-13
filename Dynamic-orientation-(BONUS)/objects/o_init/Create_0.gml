/// @description o_init create event

//display macros
#macro WIDTH global.ideal_width
#macro HEIGHT global.ideal_height
#macro DESIGN_BIG 1920
#macro DESIGN_SMALL 1080
#macro LAST_ORIENTATION global.last_orientation


global.orientation_changed = false; //will trigger tiles reposition on o_tiles object

//Let's detect the orientation of the device when the project loads
if display_get_orientation() == display_portrait or display_get_orientation() == display_portrait_flipped
then V_ORIENTATION = true; 
else V_ORIENTATION = false;

//store the current orientaion as last
LAST_ORIENTATION = display_get_orientation(); 

//experiment by changing this value to DESIGN_BIG
desing_value = DESIGN_SMALL; 

set_resolution(desing_value, V_ORIENTATION ? true : false, V_ORIENTATION, true, .5); 

alarm[0] = 1; // we will change room on the next step, just to be sure that everything will initialized correctly