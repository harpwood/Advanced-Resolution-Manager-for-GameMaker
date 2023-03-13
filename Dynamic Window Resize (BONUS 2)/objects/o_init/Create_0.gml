/// @description o_init create event

//display macros
#macro WIDTH global.ideal_width
#macro HEIGHT global.ideal_height
#macro DESIGN_WIDTH 1920  
#macro DESIGN_HEIGHT 1080

scale_w = .5; 
scale_h = .5;

set_resolution(DESIGN_WIDTH, false, false, true, .5);

last_w = DESIGN_WIDTH * scale_w;
last_h = DESIGN_HEIGHT * scale_h;

alarm[0] = 1; // we will change room on the next step, just to be sure that everything will initialized correctly