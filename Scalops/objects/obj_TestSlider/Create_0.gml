line = new ScalopsSlidingLine(from, to, init).bound_to({
    value: init,
    get_value: function() { return value; },
    set_value: function(_value) { show_debug_message($"SET TO {_value}"); value = _value; },
});
