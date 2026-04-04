function ScalopsSlidingLine(_from, _to, _init = _from) : ScalopsValue(_init) constructor {
    value_from = _from;
    value_to = _to;
    
    min_value = min(value_from, value_to);
    max_value = max(value_from, value_to);
    
    // ------
    // Checks
    // ------
    
    static is_start = function() {
        return get_value() == value_from;
    }
    
    static is_end = function() {
        return get_value() == value_to;
    }
    
    // --------
    // Measures
    // --------
    
    static get_progress = function() {
        var _span = value_to - value_from;
        if (_span == 0)
            return undefined;
        
        var _progress_amount = get_value() - value_from;
        return _progress_amount / _span;
    }
    
    // ----------
    // Management
    // ----------
    
    static increase = function(_amount) {
        if (_amount < 0)
            return decrease(-_amount);
        
        var _current = get_value();
        if (_current < max_value)
            set_value(min(_current + _amount, max_value));
        
        return get_value() == max_value;
    }
    
    static decrease = function(_amount) {
        if (_amount < 0)
            return increase(-_amount);
        
        var _current = get_value();
        if (_current > min_value)
            set_value(max(_current - _amount, min_value));
        
        return get_value() == min_value;
    }
    
    static advance = function(_amount = 1) {
        return value_from < value_to ? increase(_amount) : decrease(_amount);
    }
    
    static retract = function(_amount = 1) {
        return value_from < value_to ? decrease(_amount) : increase(_amount);
    }
}
