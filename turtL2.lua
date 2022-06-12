
position = require('position')

local DATA_PATH = '/data/turtLdata'
local PRIMITIVE_DATA_KEYS = {
    waypoints=true,
    mineBlackList=true,
    mineWhiteList=true
}
local DESTRUCTION_LEVELS = {passive=true, safe=true, destructive=true}

-------------------------------------------------------------------------------
-- TURTLE OBJECT
-------------------------------------------------------------------------------

Turtle = {
    pos = nil,
    waypoints = {},
    mineBlackList = {},
    mineWhiteList = {},
}

function Turtle:new(o)
    o = o or {}
    setmetatable(o, self)
    self.__index = self

    if not Turtle:loadData() then
        print('Persistent data not found, creating new data...')
        self.pos = position.new(0, 0, 0, 'north')
        self:createWaypoint('home', self.pos)
        Turtle:saveData()
    else
        print('Persistent data found! Loading...')
        Turtle:loadData()
    end

    return o
end

function Turtle:createWaypoint(name, waypoint)
    self.waypoints[name] = waypoint.getPrimitive()
    Turtle:saveData()
end

function Turtle:saveData()
    local f = fs.open(DATA_PATH, 'w')
    local data = {}
    for k, v in pairs(self) do
        if PRIMITIVE_DATA_KEYS[k] then
            data[k] = v
        elseif k == 'pos' and v then
            data[k] = v.getPrimitive()
        end
    end
    f.write(textutils.serialiseJSON(data))
end

function Turtle:loadData()
    if not fs.exists(DATA_PATH) then
        return false
    end
    local f = fs.open(DATA_PATH, "r")
    local data = textutils.unserialiseJSON(f.readAll())
    for k, v in pairs(data) do
        if k == 'pos' then
            self[k] = position.new(v.x, v.y, v.z, v.direction)
        else
            self[k] = v
        end
    end
    return true
end

function Turtle:turnRight(times)
    times = times or 1
    rightDirection = {N='E', E='S', S='W', W='N'}
    for i=1,times,1 do
        turtle.turnRight()
        self.pos.setDirection(rightDirection[self.pos.getDirection()])
        Turtle:saveData()
    end
end

function Turtle:turnLeft(times)
    times = times or 1
    leftDirection = {N='W', E='N', S='E', W='S'}
    for i=1,times,1 do
        turtle.turnLeft()
        self.pos.setDirection(leftDirection[self.pos.getDirection()])
        Turtle:saveData()
    end
end

function Turtle:forward(times, destruction)
    times = times or 1
    for i=1,times,1 do
        if (not turtle.forward()) then
            if DESTRUCTION_LEVELS[destruction]
        end
    end
end

t = Turtle:new(nil)
print(t.pos)
t:turnRight()
print(t.pos)
