draw_set_color(c_white);
draw_set_alpha(1);

draw_set_font(fnt_Test);
draw_set_halign(fa_left);
draw_set_valign(fa_top);
draw_text(x, y, $"{name}: {line.get_value()} ({line.value_from}->{line.value_to}) | {floor(line.get_progress() * 100)}%");
