function ScalopsSlidingLine(_from, _to, _init = _from) : ScalopsValue(_init) constructor {
    value_from = _from;
    value_to = _to;
    
    min_value = min(value_from, value_to);
    max_value = max(value_from, value_to);
    
    step = 1;
    
    static increase = function(_amount) {
        if (_amount < 0)
            decrease(-_amount);
        
        var _current = get_value();
        if (_current < max_value)
            set_value(min(_current + _amount, max_value));
    }
    
    static decrease = function(_amount) {
        if (_amount < 0)
            increase(-_amount);
        
        var _current = get_value();
        if (_current > min_value)
            set_value(max(_current - _amount, min_value));
    }
    
    static advance = function(_amount = undefined) {
        _amount ??= is_method(step) ? step() : step;
        if (value_from < value_to)
            increase(_amount);
        else
            decrease(_amount);
    }
    
    static retract = function(_amount = undefined) {
        _amount ??= is_method(step) ? step() : step;
        if (value_from < value_to)
            decrease(_amount);
        else
            increase(_amount);
    }
    
    static get_progress = function() {
        var _span = value_to - value_from;
        if (_span == 0)
            return undefined;
        
        var _progress_amount = get_value() - value_from;
        return _progress_amount / _span;
    }
}
