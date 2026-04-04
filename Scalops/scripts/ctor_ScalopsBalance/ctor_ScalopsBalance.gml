function ScalopsBalance(_cap, _cap2 = _cap) : ScalopsValue(/* init */ 0) constructor {
    var _cap2_is_negative = _cap2 < 0 && _cap > 0;
    
    negative_capacity = _cap2_is_negative ? _cap2 : -abs(_cap);
    positive_capacity = _cap2_is_negative ? _cap : abs(_cap2);
    
    // ------
    // Checks
    // ------
    
    static is_balanced = function() {
        return get_value() == 0;
    }
    
    static is_negative = function() {
        return get_value() < 0;
    }
    
    static is_positive = function() {
        return get_value() > 0;
    }
    
    // --------
    // Measures
    // --------
    
    static get_negative_span = function() {
        return -min(0, get_value());
    }
    
    static get_negative_fraction = function() {
        return negative_capacity != 0 ? min(0, get_value()) / negative_capacity : 0;
    }
    
    static get_positive_span = function() {
        return max(0, get_value());
    }
    
    static get_positive_fraction = function() {
        return positive_capacity != 0 ? max(0, get_value()) / positive_capacity : 0;
    }
    
    // ----------
    // Management
    // ----------
    
    static approach_value = function(_target, _amount = 1) {
        if (_amount < 0)
            throw ScalopsException.negative_amount(_amount);
        
        var _current = get_value();
        var _diff = abs(_target - _current);
        if (_diff <= _amount) {
            set_value(_target);
            return true;
        }
        
        var _dir = sign(_target - _current);
        set_value(_current + _amount * _dir);
        return false;
    }
    
    static approach_negative = function(_amount = 1) {
        return approach_value(negative_capacity, _amount);
    }
    
    static approach_positive = function(_amount = 1) {
        return approach_value(positive_capacity, _amount);
    }
    
    static approach_balance = function(_amount = 1) {
        return approach_value(0, _amount);
    }
    
    static approach_fraction = function(_fraction, _amount = 1) {
        var _target = 0;
        if (_fraction < 0)
            _target = _fraction * negative_capacity;
        else if (_fraction > 0)
            _target = _fraction * positive_capacity;
        
        return approach_value(_target, _amount);
    }
}
