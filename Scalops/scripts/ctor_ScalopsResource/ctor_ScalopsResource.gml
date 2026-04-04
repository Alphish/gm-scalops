function ScalopsResource(_capacity = infinity, _init = 0) : ScalopsValue(_init) constructor {
    capacity = _capacity;
    
    // ------
    // Checks
    // ------
    
    static is_full = function() {
        return get_value() >= capacity;
    }
    
    static is_empty = function() {
        return get_value() <= 0;
    }
    
    // --------
    // Measures
    // --------
    
    static get_fraction = function() {
        return get_value() / capacity;
    }
    
    // ----------
    // Management
    // ----------
    
    static increase = function(_amount) {
        if (_amount < 0)
            throw ScalopsException.negative_amount(_amount);
        
        if (_amount == 0)
            return 0;
        
        var _previous = get_value();
        var _target = min(_previous + _amount, capacity);
        set_value(_target);
        
        var _outstanding = _amount - (_target - _previous);
        return _outstanding;
    }
    
    static collect = function(_amount) {
        return increase(_amount);
    }
    
    static gain = function(_amount) {
        return increase(_amount);
    }
    
    static decrease = function(_amount) {
        if (_amount < 0)
            throw ScalopsException.negative_amount(_amount);
        
        if (_amount == 0)
            return 0;
        
        var _previous = get_value();
        var _target = max(_previous - _amount, 0);
        set_value(_target);
        
        var _outstanding = _amount - (_previous - _target);
        return _outstanding;
    }
    
    static lose = function(_amount) {
        return decrease(_amount);
    }
    
    static deplete = function(_amount) {
        return decrease(_amount);
    }
    
    // ---
    // Use
    // ---
    
    static can_spend = function(_amount) {
        if (_amount < 0)
            throw ScalopsException.negative_amount(_amount);
        
        return get_value() >= _amount;
    }
    
    static try_spend = function(_amount) {
        if (_amount < 0)
            throw ScalopsException.negative_amount(_amount);
        
        var _current = get_value();
        if (_current < _amount)
            return false;
        
        set_value(_current - _amount);
        return true;
    }
}
