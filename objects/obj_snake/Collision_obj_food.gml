/// @description Insert description here
// You can write your code in this editor

global.score += 1;
//show_debug_message(global.score);

// use obj_food's position as new head and destroy obj_food. This should create a new obj_food
//ds_list_insert(snake_block_list, 0, new Position(other.x, other.y));

if snake_direction == Direction.Up {
    //y -= obj_game_manager.block_size;
    var _next_head = new Position(other.x, other.y-obj_game_manager.block_size);
    ds_list_insert(snake_block_list, 0, _next_head);
} else if snake_direction == Direction.Right {
    //x += obj_game_manager.block_size;
    var _next_head = new Position(other.x+obj_game_manager.block_size, other.y);
    ds_list_insert(snake_block_list, 0, _next_head);
} else if snake_direction == Direction.Down {
    //y += obj_game_manager.block_size;
    var _next_head = new Position(other.x, other.y+obj_game_manager.block_size);
    ds_list_insert(snake_block_list, 0, _next_head);
} else if snake_direction == Direction.Left {
    //x -= obj_game_manager.block_size;
    var _next_head = new Position(other.x-obj_game_manager.block_size, other.y);
    ds_list_insert(snake_block_list, 0, _next_head);      
}

x = snake_block_list[|0].x;
y = snake_block_list[|0].y;

instance_destroy(other);

spawn_food();
