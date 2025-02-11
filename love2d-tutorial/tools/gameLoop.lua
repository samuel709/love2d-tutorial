--[[
This works very similarly to the renderer. We have our GameLoop table that can have objects added
to it. Then, the gameLoop:update method calls the tick() method on each object in the table.
]]--

local GameLoop = {}

local insert = table.insert
local remove = table.remove

function GameLoop:create()
    local gameLoop = {}

    gameLoop.tickers = {}

    function gameLoop:addLoop(obj)
        insert(self.tickers,obj)
    end

    function gameLoop:update(dt)

        for val = 0, #self.tickers do
            local obj = self.tickers[val]
            if obj ~= nil then
                obj:tick(dt)
            end
        end

    end

    return gameLoop
end

return GameLoop