line = new ScalopsSlidingLine(from, to, init);
line.step = step;

line.bind({
    value: init,
    get_value: function() { return value; },
    set_value: function(_value) { show_debug_message($"SET TO {_value}"); value = _value; },
});
