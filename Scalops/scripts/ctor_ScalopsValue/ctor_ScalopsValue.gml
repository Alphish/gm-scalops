function ScalopsValue(_init) constructor {
    value = _init;
    
    static get_value = function() {
        return value;
    }
    
    static set_value = function(_value) {
        value = _value;
    }
    
    static bound_to = function(_property) {
        value = _property;
        get_value = method(_property, _property.get_value);
        set_value = method(_property, _property.set_value);
        return self;
    }
}
