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

positionMetatable = {}

function newPosition(x, y, z, direction)
    local self = {x=x, y=y, z=z, direction=direction}
    local setX = function(v)
        self.x = v
    end
    local setY = function(v)
        self.y = v
    end
    local setZ = function(v)
        self.z = v
    end
    local setDirection = function(v)
        self.direction = v
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


    instance = setmetatable({
        setX=setX,
        setY=setY,
        setZ=setZ,
        setDirection = setDirection,
        getX=getX,
        getY=getY,
        getZ=getZ,
        getDirection = getDirection
    }, positionMetatable)

    return instance
end

positionMetatable.__tostring = function(self)
    return string.format("Position [x=%d, y=%d, z=%d, direction=%s]", self.x, self.y, self.z, self.direction)
end

p1 = newPosition(1,1,1,'n')
p2 = newPosition(2,2,2, 's')

print(p1)