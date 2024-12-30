/// @description Insert description here
// You can write your code in this editor


enum Direction {
    Up,
    Right,
    Down,
    Left,
}

snake_speed = 20;
alarm[0] = snake_speed;

snake_direction = Direction.Up;

snake_block_list = ds_list_create();
ds_list_add(snake_block_list, new Position(x, y));
ds_list_add(snake_block_list, new Position(x, y+16));
ds_list_add(snake_block_list, new Position(x, y+32));
//ds_list_add(snake_block_list, new Position(x, y+48));
//ds_list_add(snake_block_list, new Position(x, y+64));
//ds_list_add(snake_block_list, new Position(x, y+80));
//ds_list_add(snake_block_list, new Position(x, y+96));


function draw_snake() {
    for (var _i = 0; _i < ds_list_size(snake_block_list); _i++) {
        //show_debug_message(snake_block_list[|_i]);
        draw_sprite(spr_block, 0, snake_block_list[|_i].x, snake_block_list[|_i].y);
    }
}


function update_positions(_dir) {
    // check if hitting wall or body then game over
    if _dir == Direction.Up {
        //y -= obj_game_manager.block_size;
        var _head = snake_block_list[|0];
        var _next_head = new Position(_head.x, _head.y-obj_game_manager.block_size);
        ds_list_insert(snake_block_list, 0, _next_head);
        ds_list_delete(snake_block_list, ds_list_size(snake_block_list)-1);
    } else if _dir == Direction.Right {
        //x += obj_game_manager.block_size;
        var _head = snake_block_list[|0];
        var _next_head = new Position(_head.x+obj_game_manager.block_size, _head.y);
        ds_list_insert(snake_block_list, 0, _next_head);
        ds_list_delete(snake_block_list, ds_list_size(snake_block_list)-1);
    } else if _dir == Direction.Down {
        //y += obj_game_manager.block_size;
        var _head = snake_block_list[|0];
        var _next_head = new Position(_head.x, _head.y+obj_game_manager.block_size);
        ds_list_insert(snake_block_list, 0, _next_head);
        ds_list_delete(snake_block_list, ds_list_size(snake_block_list)-1);
    } else if _dir == Direction.Left {
        //x -= obj_game_manager.block_size;
        var _head = snake_block_list[|0];
        var _next_head = new Position(_head.x-obj_game_manager.block_size, _head.y);
        ds_list_insert(snake_block_list, 0, _next_head);
        ds_list_delete(snake_block_list, ds_list_size(snake_block_list)-1);        
    }
    
    x = snake_block_list[|0].x;
    y = snake_block_list[|0].y;
}

function is_game_over() {
    // game over in two cases
    // 1. snake head hits wall
    var _head = snake_block_list[|0];
    if _head.x < 0 || _head.x >= 640 || _head.y < 0 || _head.y >= 320 {
        return true;
    }
    
    // 2. snake hits himself (meaning there are collisions in list)
    var _n = ds_list_size(snake_block_list);
    for (var _i = 0; _i < _n; _i++) {
        for (var _j = _i+1; _j < _n; _j++) {
            if snake_block_list[|_i].Equals(snake_block_list[|_j]) {
                return true;
            }
        }
    }
    return false;
}


function invalid_food_position(_x, _y) {
    for (var _i = 0; _i < ds_list_size(snake_block_list); _i++) {
        var _curr = snake_block_list[|_i];
        if _curr.Equals(new Position(_x, _y)) {
            return true;
        }
    }
    return false;
}


function spawn_food() {
    var food_x = irandom_range(0, 640-16);
    var food_y = irandom_range(0, 320-16);
    food_x -= food_x % 16;
    food_y -= food_y % 16;
    
    while invalid_food_position(food_x, food_y) { 
        food_x = irandom_range(0, 640-16);
        food_y = irandom_range(0, 320-16);
        food_x -= food_x % 16;
        food_y -= food_y % 16;        
    }
    
    instance_create_layer(food_x, food_y, "Instances", obj_food);
}
