/// @description Insert description here
// You can write your code in this editor

rows = ceil(HEIGHT / tile_size);
cols = ceil(WIDTH / tile_size);

show_debug_message("rows: " + string(rows));
show_debug_message("cols: " + string(cols));

global.orientation_changed = false;
show_debug_message("orientation changed");