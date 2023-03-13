/// @description o_init create event

//display macros
#macro WIDTH global.ideal_width
#macro HEIGHT global.ideal_height
#macro DESIGN_WIDTH 1920
#macro DESIGN_HEIGHT 1080


//	
//IMPORTANT: USE ONLY ONE set_resolution at a time
// For Non VM->Test Desktop builds, remove the .5 value
// like this -> set_resolution(DESIGN_WIDTH + 240, false, false, true);

//try this if you want the ideal resolution to be based on WIDTH 
set_resolution(DESIGN_WIDTH, false, false, true, .5);

//try this if you want the ideal resolution to be based on HEIGHT
//You need a monitor with different aspect ration than 16:9 or... 
//...a mobile device or emulator to see actual changes...
//...but feel free to experiment by changing the DESIGN_WIDTH and DESIGN_HEIGHT values.
//set_resolution(DESIGN_HEIGHT, true, false, true, .5);

//try this if you want the ideal resolution to be based on WIDTH and to hard code the HEIGHT
// let's pretend that we test on a tablet without using emulator ;) - will only work with VM->TEST (debug tool)
//set_resolution(DESIGN_WIDTH, false, false, true, .5, 1280);

//try this if you want the ideal resolution to be based on HEIGHT and to hard code the WIDTH
// let's try a really crazy aspect ratio 16:3 (48:9) just for fun  - will only work with VM->TEST (debug tool)
//set_resolution(DESIGN_HEIGHT, true, false, true, .25, 5760);

//By hard coding the aspect ratio you can test your game on-the-fly...
// ...on any possible screen without using emulator


alarm[0] = 1; // we will change room on the next step, just to be sure that everything will initialized correctly