/// @description camera and UI init

set_camera(0, 0, WIDTH, HEIGHT); 
set_gui_size(WIDTH); 

if os_type == os_windows or os_type == os_linux or os_type == os_macosx 
then window_center(); //this will center the window