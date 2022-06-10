local DIRECTIONS = {N=true, E=true, S=true, W=true}

-------------------------------------------------------------------------------
-- POSITION OBJECT
-------------------------------------------------------------------------------

local position = {}
position.__index = position
position.__tostring = function(self)
    return string.format('Position [x=%d, y=%d, z=%d, direction=%s]',
    self.getX(), self.getY(), self.getZ(), self.getDirection())
end


function position.new(x, y, z, direction)
    local self = {}
    local setX = function(v)
        assert (type(v) == "number")
        self.x = v
    end
    local setY = function(v)
        assert (type(v) == "number")
        self.y = v
    end
    local setZ = function(v)
        assert (type(v) == "number")
        self.z = v
    end
    local setDirection = function(v)
        assert(type(v) == 'string' and
            DIRECTIONS[string.upper(string.sub(v,1,1))],
            'Invalid Direction')
        self.direction = string.upper(string.sub(v,1,1))
    end
    local getX = function()
        return self.x
    end
    local getY = function()
        return self.y
    end
    local getZ = function()
        return self.z
    end
    local getDirection = function()
        return self.direction
    end
    setX(x)
    setY(y)
    setZ(z)
    setDirection(direction)

    instance = {
        setX=setX,
        setY=setY,
        setZ=setZ,
        setDirection = setDirection,
        getX=getX,
        getY=getY,
        getZ=getZ,
        getDirection = getDirection
    }

    return setmetatable(instance, position)
end

return position


