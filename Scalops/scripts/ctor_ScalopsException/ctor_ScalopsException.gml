/// @desc An exception to be thrown due to invalid Scalops usage.
/// @arg {String} code              The code of the exception to differentiate between different exception causes.
/// @arg {String} description       A detailed description explaining the exception.
function ScalopsException(_code, _description) constructor {
    /// @desc The code of the exception to differentiate between different exception causes.
    /// @type {String}
    code = _code;
    
    /// @desc A detailed description explaining the exception.
    /// @type {String}
    description = _description;
    
    toString = function() {
        return $"Scalops.{code}: {description}";
    }
}

ScalopsException.negative_amount = function(_amount) {
    return new ScalopsException(
        nameof(negative_amount),
        $"The amount must be non-negative, but {_amount} was given."
        );
}
