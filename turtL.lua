-------------------------------------------------------------------------------
-- HELPERS
-------------------------------------------------------------------------------

function dump(o)
    if type(o) == 'table' then
       local s = '{ '
       for k,v in pairs(o) do
          if type(k) ~= 'number' then k = '"'..k..'"' end
          s = s .. '['..k..'] = ' .. dump(v) .. ','
       end
       return s .. '} '
    else
       return tostring(o)
    end
 end

-------------------------------------------------------------------------------
-- POSITION OBJECT
-------------------------------------------------------------------------------
Position = {}
Position.prototype = {
    setX = nil,
    setY = nil,
    setZ = nil,
    setDirection = nil,
    getPos = nil
}
Position.metatable = {__index = Position.prototype}

function Position.new(x, y, z, direction)
    local DIRECTIONS = {N=true, E=true, S=true, W=true}

    local instance = setmetatable({}, Position.metatable)
    
    -- Private Variables
    local pX
    local pY
    local pZ
    local pDirection

    -- Public Functions
    function instance:setX(v)
        assert (type(v) == "number")
        pX = v
        print(pX)
    end
    function instance:setY(v)
        assert (type(v) == 'number')
        pY = v
    end
    function instance:setZ(v)
        assert (type(v) == 'number')
        pZ = v
    end
    function instance:setDirection(v)
        assert(type(v) == 'string' and DIRECTIONS[string.upper(string.sub(v,1,1))], 'Invalid Direction')
        pDirection = string.upper(string.sub(v,1,1))
        print(pDirection)
    end
    function instance:getPos()
        return {x=pX, y=pY, z=pZ, direction=pDirection}
    end
    
    

    -- Initialise private variables
    instance:setX(x)
    instance:setY(y)
    instance:setZ(z)
    instance:setDirection(direction)

    return instance
end

p1 = Position.new(1,1,1,'n')

-------------------------------------------------------------------------------
-- TURTLE OBJECT
-------------------------------------------------------------------------------
Turtle = {}
Turtle.prototype = {
    forward = nil,
    back = nil,
    up = nil,
    down = nil,
    right = nil,
    left = nil,
    gotoPos = nil,
    getPos = nil,
    getFuel = nil,
    setFuelLocation = nil,
    getfuelLocation = nil,
    refuel = nil,
    placeItem = nil
}

