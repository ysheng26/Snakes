/// @description Insert description here
// You can write your code in this editor

//show_debug_message(room_width);
//show_debug_message(room_height);


global.score = 0;

block_size = 16;

show_outline = false;

// draw the grid
if show_outline {
    for (var _i = 0; _i < room_width; _i += block_size) {
        for (var _j = 0; _j < room_height; _j += block_size) {
            instance_create_layer(_i, _j, "Instances", obj_outline);
        }
    }
}
    
randomize();

var snake_x = irandom_range(32, 640-64);
var snake_y = irandom_range(32, 320-64);
snake_x -= snake_x % 16
snake_y -= snake_y % 16

snake_instance = instance_create_layer(snake_x, snake_y, "Instances", obj_snake);

snake_instance.spawn_food();
