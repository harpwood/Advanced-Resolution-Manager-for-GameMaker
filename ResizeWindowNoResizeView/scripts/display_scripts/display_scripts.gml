/// @func set_resolution(design_value, [is_design_vertical], [is_orientation_vertical], [resize_all_rooms], [scale], [overide_other_value])
/// @arg _design_value				  		
/// @arg _is_design_value_vertical
/// @arg _is_orientation_vertical
/// @arg _resize_all_rooms
/// @arg _scale
/// @arg _overide_other_value 	
/// @description				Sets and stores the resulted resolution in global.ideal_width 
///								and global.ideal_height vars. 
///								More information and tutorials about this script at 
///								https://harpwood.itch.io/advanced-resolution-manager
///								Brief explanation of the arguments bellow. The values inside the [] brackets
//								are the default values if the corresponding argument is ommited
/// _design_value				real				width or height of ideal resolution
/// _is_design_value_vertical	boolean	[false]		When true, the design_value is condidered as height; 
///													when false, as width
/// _is_orientation_vertical	boolean	[false]		When true, the screen orientation is considered as portrait; 
///													when false, as landscape
/// _resize_all_rooms			boolean	[false]		When true: Rooms (except room index 0), will be resized 
//													to resulting value. 
/// _scale					    real	[undefined] Scale the game window to better fit the monitor. 
///													Will ommited on any non windows and non macos builds.
/// _overide_other_value		real	[undefined] Overides the value other than the design_value arg for 
///													a custom aspect ratio. Will ommited like scale arg.
///
/// @Examples		set_resolution(640); set_resolution(480, true, true); set_resolution(640,,,,,480);
///
/// @Author			Written by George Kritikos (Harpwood studio) - Based on code written by Pixelated_Pope
/// @License		MIT License https://opensource.org/licenses/MIT
function set_resolution(_design_value, _is_design_value_vertical = false, _is_orientation_vertical = false, _resize_all_rooms = false, _scale = undefined, _overide_other_value = undefined) {
	

	if _scale == undefined then _scale = 1;
	
	//detect os_type only if is GMS2 IDE approprate
	var _os_type = undefined;
	_os_type = os_type == os_windows ? os_windows : os_macosx;	
	
	// The design value is either the design width or height. Every calculation in build with Test -> VM get a temporary scaling
	var _desing_width	= os_type == _os_type ? _design_value * _scale : _design_value;
	var _desing_height	= os_type == _os_type ? _design_value * _scale : _design_value;

	var _real_width, _real_height, _aspect_ratio, _ideal_width, _ideal_height;

	if _is_orientation_vertical 
	{
		//dirty way to get portait orientation for os_windows/os_macosx
		_real_width		= os_type == _os_type ? display_get_height()  * _scale : display_get_width(); 
		_real_height	= os_type == _os_type ? display_get_width()	* _scale : display_get_height();
		_aspect_ratio	= _real_width >= _real_height ? _real_height / _real_width : _real_width / _real_height;
	
		if _is_design_value_vertical	//The design value is reffering to vertical so we calculate the horizontal 
		{
			_ideal_height = _desing_height;
			if os_type == _os_type then _ideal_width = _overide_other_value == undefined ? round(_ideal_height * _aspect_ratio) : _overide_other_value * _scale;
			else _ideal_width = round(_ideal_height * _aspect_ratio);
		}
		else							//and vice versa
		{
			_ideal_width = _desing_width;
			if os_type == _os_type then _ideal_height = _overide_other_value == undefined ? round(_ideal_width / _aspect_ratio) : _overide_other_value * _scale;
			else _ideal_height = round(_ideal_width / _aspect_ratio);
		}
	
	}
	else
	{
		_real_width		= os_type == _os_type ? display_get_width()  * _scale : display_get_width();
		_real_height	= os_type == _os_type ? display_get_height() * _scale : display_get_height();
		_aspect_ratio	= _real_width >= _real_height ? _real_height / _real_width : _real_width / _real_height;
	
	
		if _is_design_value_vertical	//The design value is reffering to vertical so we calculate the horizontal 
		{
			_ideal_height = _desing_height;
			if os_type == _os_type then _ideal_width = _overide_other_value == undefined ?  round(_ideal_height / _aspect_ratio) : _overide_other_value * _scale;
			else _ideal_width =  round(_ideal_height / _aspect_ratio);
		}
		else							//and vice versa
		{
			_ideal_width = _desing_width;
			if os_type == _os_type then _ideal_height = _overide_other_value == undefined ? round(_ideal_width * _aspect_ratio) : _overide_other_value * _scale;
			else _ideal_height = round(_ideal_width * _aspect_ratio);
		}
	}
	
	//make the results more pixel perfect friendly
	if _ideal_width & 1 then _ideal_width++;
	if _ideal_height & 1 then _ideal_height++;

	if _resize_all_rooms //apply resolution results to all rooms?
	{
		for (var i = 1; i < room_last; i++) //all rooms except room with index 0, which usually is the init room
		{
			if room_exists(i)
			{
				room_set_width(i, _ideal_width);
				room_set_height(i, _ideal_height);
			}
		}
	}

	application_surface_enable(false);  // false as default behaviour 
	window_set_size(_ideal_width, _ideal_height);
	surface_resize(application_surface, _real_width, _real_height);

	//remove the temporary scaling if building with Test -> VM and apply results in global vars for further use
	global.ideal_width = os_type == _os_type ? _ideal_width / _scale : _ideal_width;
	global.ideal_height = os_type == _os_type ? _ideal_height / _scale : _ideal_height;

	
}

///@func set_camera(x1, y1, x2, y2)
///@arg x1 
///@arg y1
///@arg x2
///@arg y2
/// @description	Defines the view area of view_camera[0] as a rectacle x1,y1,x2,y2
///					It is a very basic camera script for the sake of simplicity. If you need 
///					more complex camera functionality you will have to implemente it yourself
///
/// @Examples		set_camera(0, 0, global.ideal_width, global.ideal_height);
///
/// @Author			Written by George Kritikos (Harpwood studio)
/// @License		MIT License https://opensource.org/licenses/MIT
function set_camera(x1, y1, x2, y2) {
		
		view_enabled = true;
		view_visible[0] = true;
		view_wport[0] = x2; 
		view_hport[0] = y2; 
	
		view_camera[0] = camera_create_view(x1, y1, view_wport[0], view_hport[0], 0, -1, -1, -1, 0, 0);
}


///@func set_gui_size(_width, _height)
///@arg _width 
///@arg _height 
/// @description	Defines the GUI layers size. 
///					If both arguments ommited then the GUI layers size will be the same as the game's resolution
///					If either argument ommited then it will be calculated to fit the current aspect ratio of the
///					game's resolution.
///
/// @Examples		set_camera(0, 0, global.ideal_width, global.ideal_height);
///
/// @Author			Written by George Kritikos (Harpwood studio)
/// @License		MIT License https://opensource.org/licenses/MIT
function set_gui_size(_width = undefined, _height = undefined) {

	
	if _width == undefined and _height == undefined
	{
		_width = global.ideal_width;
		_height = global.ideal_height;
	}
	if _width == undefined then _width = global.ideal_width * _height / HEIGHT;
	if _height == undefined then _height = global.ideal_height * _width / global.ideal_width;
	display_set_gui_size(_width, _height);
		
	global.width_gui = _width;
	global.height_gui = _height;
	
}
