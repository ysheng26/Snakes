
function Position(_x, _y) constructor {
    x = _x;
    y = _y;
    
    static Equals = function(_p) {
        if x == _p.x && y == _p.y {
            return true;
        }
        return false;
    }
}

