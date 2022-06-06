-- CONSTANTS
local DISK_DRIVE = 'computercraft:disk_drive'
local DISK = 'computercraft:disk'
local TURTLE_CONTAINER = 'storagedrawers:oak_half_drawers_4'
local PLACE_DIRS = {up=true, down=true, front=true}
local PLACE_IN_DIR = {up=turtle.placeUp, down=turtle.placeDown, front=turtle.place}
local SUCK_IN_DIR = {up=turtle.suckUp, down=turtle.suckDown, front=turtle.suck}


function selectEmpty()
    for i =1,16,1 do
        local item = turtle.getItemDetail(i)
        if item == nil then
            turtle.select(i)
            return true
        end
        return false
    end
end

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
    assert(PLACE_DIRS[direction], "Invalid direction")
    local slot = getItemSlot(name)
    if slot == nil then return nil end
    turtle.select(slot)

    return PLACE_IN_DIR[direction]()
end

function unloadTurtles(storageDirection, placeDirection)
    assert(PLACE_DIRS[storageDirection], "invalid storage direction")
    assert(PLACE_DIRS[placeDirection], "invalid place direction")

    selectEmpty()

    while SUCK_IN_DIR[storageDirection]() do
        while not PLACE_IN_DIR[placeDirection]() do
            sleep(1)
            print("waiting for free block space...")
        end
    end

end

function main()
    local turtleContainers = getItemSlotList(TURTLE_CONTAINER)
    local emptyContainerSlot = turtleContainers[1]
    for _, v in pairs(turtleContainers) do
        turtle.select(v)
        turtle.placeUp()
        unloadTurtles('up', 'front')
        turtle.select(emptyContainerSlot)
        assert(#turtle.getItemDetail() == 0 or turtle.getItemDetail.name == TURTLE_CONTAINER)
        turtle.digUp()
    end

end
s
main()