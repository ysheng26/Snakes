/// @description Insert description here
// You can write your code in this editor
update_positions(snake_direction);

var _speed = lerp(snake_speed, max_snake_speed, global.score / 20);

_speed = max(_speed, max_snake_speed);

//alarm[0] = snake_speed;
alarm[0] = _speed;
show_debug_message(_speed);
