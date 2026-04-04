function ScalopsCooldown(_period) : ScalopsValue(/* init */ 0) constructor {
    period = _period;
    
    // ------
    // Checks
    // ------
    
    static is_ready = function() {
        return get_value() <= 0;
    }
    
    static is_pending = function() {
        return get_value() > 0;
    }
    
    // --------
    // Measures
    // --------
    
    static get_fraction = function() {
        return get_value() / period;
    }
    
    // ----------
    // Management
    // ----------
    
    static start = function(_period = undefined) {
        set_value(_period ?? period);
    }
    
    static start_over = function(_period = undefined) {
        start(_period);
    }
    
    static clear = function() {
        set_value(0);
    }
    
    static recover = function(_rate = 1, _overshoot = false) {
        if (_rate < 0)
            throw ScalopsException.negative_amount(_rate);
        
        var _current = get_value();
        var _target = _overshoot ? max(0, _current) - _rate : max(0, _current - _rate);
        set_value(_target);
        return _target <= 0;
    }
    
    static delay = function(_amount, _overshoot = false) {
        if (_amount < 0)
            throw ScalopsException.negative_amount(_amount);
        
        var _target = get_value() + _amount;
        if (!_overshoot && _target > period)
            _target = period;
        
        set_value(_target);
        return _target >= period;
    }
    
    // ---
    // Use
    // ---
    
    static try_use = function(_period = undefined) {
        var _current = get_value();
        if (_current > 0)
            return false;
        
        set_value(_current + (_period ?? period));
        return true;
    }
}
