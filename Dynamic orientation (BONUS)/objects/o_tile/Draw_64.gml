/// @description Insert description here
// You can write your code in this editor


// ui on the top/left tile
draw_sprite(s_tile_ui_3, 0, 0, 0);

// ui on the 2 last col tiles 
draw_sprite(s_tile_ui, 0, tile_size * (cols - 1), 0);
draw_sprite(s_tile_ui_3, 0, tile_size * (cols - 2), 0);
// ui on the 2 last row tiles
draw_sprite(s_tile_ui, 0, 0, tile_size * (rows - 1));
draw_sprite(s_tile_ui_3, 0, 0, tile_size * (rows - 2));


//ui on random tile
	
draw_sprite(s_tile_ui_2, 0, random_col, random_row);





