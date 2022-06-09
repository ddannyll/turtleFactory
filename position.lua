local DIRECTIONS = {N=true, E=true, S=true, W=true}

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
Position.__index = Position
Position.__tostring = function (o)
    return string.format("Position [x=%d, y=%d, z=%d, direction=%s]", self., pY, pZ, pDirection)
end


-- Position Constructor
function Position.new(x, y, z, direction)
    local instance = setmetatable({}, Position)
    
    -- Private Variables
    local pX
    local pY
    local pZ
    local pDirection



    -- Position Public Methods
    function instance:setX(v)
        assert (type(v) == "number")
        pX = v
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
    end
    function instance:getPos()
        return {x=pX, y=pY, z=pZ, direction=pDirection}
    end
    function instance:__tostring()
        return 
    end
    

    -- Initialise private variables
    instance:setX(x)
    instance:setY(y)
    instance:setZ(z)
    instance:setDirection(direction)

    return instance
end

p1 = Position.new(1,1,1,'n')
p2 = Position.new(2,2,2, 's')
print(p1.__tostring(p1))

-- i want to die this doesnt maek sense