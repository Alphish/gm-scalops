draw_sprite(sprite_index, 0, x, y);

if (balance.is_negative())
    draw_sprite_ext(sprite_index, 1, x, y, 1, 1, 0, c_white, balance.get_negative_fraction());

if (balance.is_positive())
    draw_sprite_ext(sprite_index, 2, x, y, 1, 1, 0, c_white, balance.get_positive_fraction());
