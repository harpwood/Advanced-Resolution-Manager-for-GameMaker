function draw_text_outlined_ext() {
	//draw_text_outlined(x, y, outline color, string color, string)  
	///@arg x
	///@arg y
	///@arg outlinecolor
	///@arg string_color
	///@arg string
	///@arg outline_thickness
	///@arg xscale 
	///@arg yscale 

	var xx,yy;  
	xx = argument[0];  
	yy = argument[1];
	var _thickness = argument[5];
  
	//Outline  
	draw_set_color(argument[2]);  
	draw_text_transformed(xx + _thickness,	yy + _thickness, argument[4], argument[6], argument[7] ,0);
	draw_text_transformed(xx - _thickness,	yy - _thickness, argument[4], argument[6], argument[7] ,0);
	draw_text_transformed(xx,				yy + _thickness, argument[4], argument[6], argument[7] ,0);
	draw_text_transformed(xx + _thickness,  yy,				 argument[4], argument[6], argument[7] ,0); 
	draw_text_transformed(xx,				yy - _thickness, argument[4], argument[6], argument[7] ,0);
	draw_text_transformed(xx - _thickness,	yy,				 argument[4], argument[6], argument[7] ,0);
	draw_text_transformed(xx - _thickness,	yy + _thickness, argument[4], argument[6], argument[7] ,0);
	draw_text_transformed(xx + _thickness,	yy - _thickness, argument[4], argument[6], argument[7] ,0);
  
	//Text  
	draw_set_color(argument[3]);  
	draw_text_transformed(xx, yy, argument[4], argument[6], argument[7] ,0);
	draw_set_color(c_white); 


}
