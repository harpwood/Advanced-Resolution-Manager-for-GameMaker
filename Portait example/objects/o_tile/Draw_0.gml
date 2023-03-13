/// @description Insert description here
// You can write your code in this editor


var str;

draw_set_halign(fa_center);
draw_set_valign(fa_middle);

for (var i = 0; i < rows; i++)
{
	for (var j = 0; j < cols; j++)
	{
		
		draw_sprite(s_tile, 0, tile_size * j, tile_size * i);	
		
		if i == 0 and j == 0 then str = "1";
		else if j == 0 and i > 0 then str = string(i + 1);
		else if i == 0 and j > 0 then str = string(j + 1); else str = "";
		draw_text_transformed(tile_size * j + tile_size / 2, tile_size * i + tile_size / 2, str, 3, 3, 0);
		//draw_text_transformed(tile_size * j, tile_size * i, string(j+1) + "," + string(i+1), 3, 3, 0);
		
	}
}

if i == rows and j == cols then frame = false;





