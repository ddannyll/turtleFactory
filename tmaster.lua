-- CONSTANTS
local DISK_DRIVE = 'computercraft:disk_drive'
local DISK = 'computercraft:disk'
local TURTLE_CONTAINER = 'storagedrawer:oak_half_drawers_4'
local PLACE_DIRECTIONS = {up=true, down=true, front=true}

function getItemSlotList(name)
    local list = {}
    for i = 1,16,1 do
        local item = turtle.getItemDetail(i) 
        if item ~= nil and item.name == name then
            table.insert(list, i)
        end
    end
    return list
end

function getItemSlot(name)
    for i = 1,16,1 do
        local item = turtle.getItemDetail(i)
        if item ~= nil and item.name == name then
            return i
        end
    end
    return nil
end

function placeItem(name, direction)
    assert(PLACE_DIRECTIONS[direction], "Invalid direction")
    local slot = getItemSlot(name)
    if slot == nil then return nil end
    turtle.select(slot)

    local success
    if direction == 'up' then
        success = turtle.placeUp()
    elseif direction == 'down' then
        success = turtle.placeDown()
    elseif direction =='front' then
        success = turtle.place()
    end
    return success
end

function main()
    local turtleContainers = getItemSlotList(TURTLE_CONTAINER)
    for _, v in pairs(turtleContainers) do
        print(v)
    end

end

main()