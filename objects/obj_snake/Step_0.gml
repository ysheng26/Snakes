/// @description Insert description here
// You can write your code in this editor

if keyboard_check_pressed(vk_up) && snake_direction != Direction.Down {
    snake_direction = Direction.Up;
} else if keyboard_check_pressed(vk_right) && snake_direction != Direction.Left {
    snake_direction = Direction.Right;
} else if keyboard_check_pressed(vk_down) && snake_direction != Direction.Up {
    snake_direction = Direction.Down;
} else if keyboard_check_pressed(vk_left) && snake_direction != Direction.Right {
    snake_direction = Direction.Left;
} 

if is_game_over() {
    show_debug_message("GAME OVER");
    room_goto(rm_gameover);
}