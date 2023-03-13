/// @description camera after size change 

last_w = window_get_width();
last_h = window_get_height();

set_camera(0,0, WIDTH, HEIGHT);
set_gui_size(WIDTH,HEIGHT);

