/// @description o_init create event

//display macros
#macro WIDTH global.ideal_width
#macro HEIGHT global.ideal_height
#macro DESIGN_WIDTH 960  //1920
#macro DESIGN_HEIGHT 540 //1080


scale_w = 1; //0.5
scale_h = 1; //0.5

set_resolution(DESIGN_WIDTH, false, false, true, 1);

last_w = DESIGN_WIDTH * scale_w;
last_h = DESIGN_HEIGHT * scale_h;

alarm[0] = 1; // we will change room on the next step, just to be sure that everything will initialized correctly