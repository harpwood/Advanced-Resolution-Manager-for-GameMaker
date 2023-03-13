/// @description o_init create event

//display macros
#macro WIDTH global.ideal_width
#macro HEIGHT global.ideal_height
#macro DESIGN_WIDTH 1080
#macro DESIGN_HEIGHT 1920


//	
//IMPORTANT: USE ONLY ONE set_resolution at a time
//	

//try this if you want the ideal resolution to be based on WIDTH 
//(You need a mobile device or emulator to see actual changes)
set_resolution(DESIGN_WIDTH, false, true, true, .5);

//try this if you want the ideal resolution to be based on HEIGHT
//(You need a mobile device or emulator to see actual changes)
//set_resolution(DESIGN_HEIGHT, true, true, true, .5);

//try this if you want the ideal resolution to be based on WIDTH and to hard code the HEIGHT
// let's pretend that we test on a tablet without using emulator ;) - will only work with VM->TEST (debug tool)
//set_resolution(DESIGN_WIDTH, false, true, true, .5, 1600);

//try this if you want the ideal resolution to be based on HEIGHT and to hard code the WIDTH
// let's try a really crazy aspect ratio 16:3 just for fun  - will only work with VM->TEST (debug tool)
//set_resolution(DESIGN_HEIGHT, true, true, true, .5, 360);

//By hard coding the aspect ratio you can test your game on-the-fly...
// ...on any possible screen without using emulator


alarm[0] = 1; // we will change room on the next step, just to be sure that everything will initialized correctly