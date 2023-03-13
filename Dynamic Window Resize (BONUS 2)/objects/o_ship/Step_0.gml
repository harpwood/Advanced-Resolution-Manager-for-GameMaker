/// @description Insert description here
// You can write your code in this editor

if keyboard_check(vk_left) then image_angle += 5;
if keyboard_check(vk_right) then image_angle -= 5;
if keyboard_check(vk_up) then motion_add(image_angle, .1);
if keyboard_check(vk_down) then motion_set(image_angle, 0);

move_wrap(true, true, sprite_width / 2);