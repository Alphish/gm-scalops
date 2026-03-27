image_index = hp.is_empty() ? 1 : 0;
draw_self();

draw_healthbar(x, y - 20, x + sprite_width, y - 4, hp.get_percentage(), c_green, c_lime, c_lime, 0, true, false);
draw_set_color(c_black);
draw_set_alpha(1);
draw_set_font(fnt_Test);
draw_set_halign(fa_left);
draw_set_valign(fa_middle);
draw_text(x + 4, y - 12, ceil(hp.get_value()));

draw_set_color(c_white);
