Position = require('position.lua')

-------------------------------------------------------------------------------
-- TURTLE OBJECT
-------------------------------------------------------------------------------
Turtle = {}
Turtle.__index = Turtle
local destructionLevels = {passive=true, safe=true, destructive=true}

-- Turtle Constructor
function Turtle.new()
    self.waypoints = {}
    self.mineBlackList = {}


    local pos
    local waypoints = {}
    local mineBlackList = {tags={}, names={}}
    local mineWhiteList = {tags={}, names={}}

    -- Private functions
    local isSafeToMine = function()
        block = turtle.inspect()
    end

    -- Public functions
    local setPos = function(v)
        self.pos = v
    end
    local createWaypoint = function (name, pos)

    end

    -- Initialise private variables
    pos = instance:setPos(Position.new(0,0,0,'N'))
    

    print(textutils.serialise(instance))
    return instance
end

-- Turtle Public Methods
function Turtle:setPos(pos)
    self.pos = pos
end
function Turtle:createWaypoint(name, pos)
    self.waypoints[name] = pos
end
function Turtle:forward()
    if (turtle.forward()) then
        local direction = self.pos.getPos().direction
        if direction == 'N' then
           self.pos.setZ(self.pos.getPos().z - 1)
        end
    end
end
function Turtle:getPos()
    return self.pos
end


local t = Turtle.new()
t:forward()
print(t:getPos())

-- forward = nil,
-- back = nil,
-- up = nil,
-- down = nil,
-- right = nil,
-- left = nil,
-- gotoPos = nil,
-- getPos = nil,
-- getFuel = nil,
-- setFuelPos = nil,
-- getFuelPos = nil,
-- refuel = nil,
-- placeItem = nil
-- waypoint 

