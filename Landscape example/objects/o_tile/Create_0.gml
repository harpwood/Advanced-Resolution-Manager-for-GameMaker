/// @description Insert description here
// You can write your code in this editor

tile_size = 120;

rows = ceil(HEIGHT / tile_size);
cols = ceil(WIDTH / tile_size);

random_col = tile_size * irandom(cols - 1);
random_row = tile_size * irandom(rows - 1);

alarm[0] = 60;