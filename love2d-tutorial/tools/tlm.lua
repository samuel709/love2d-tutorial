local Tlm = {}

local quad = love.graphics.newQuad
local quads = {
    quad(0,0,16,16,80,16),
    quad(16,0,16,16,80,16),
    quad(32,0,16,16,80,16),
    quad(48,0,16,16,80,16),
    quad(64,0,16,16,80,16),
}

local function tile(x,y,w,h,quad)
    local tile = {}

    tile.pos = require("tools/vec2"):new(x,y)
    tile.size = require("tools/vec2"):new(w,h)
    tile.quad = quad

    return tile
end

function Tlm:load()
    self.tiles = {}
    self.img = love.graphics.newImage("assets/tile_sheet_1.png")

    renderer:addRenderer(self)
end

function Tlm:loadmap(mapname)
    local map = require ("assets/maps/"..mapname)

    for i = 1, map.height do self.tiles[i] = {} end

    for layer = 1, #map.layers do
        local data = map.layers[layer].data
        local prop = map.layers[layer].properties

        for y = 1, map.height do
            for x = 1, map.width do
                local index = (y*map.height + (x+1) - map.width) + 1
                
                if data[index] ~= 0 then
                    
                    local q = quads[data[index]]
                    self.tiles[y][x] = tile(16*x - 16, 16*y - 16,16,16,q)

                end

            end
        end
    end
end

function Tlm:draw()
    for i = 1, #self.tiles do
        for j = 1, #self.tiles[i] do
            
            if self.tiles[i][j] ~= nil then
                local tile = self.tiles[i][j]
                love.graphics.draw(self.img,tile.quad,tile.pos.x,tile.pos.y)
            end

        end
    end
end

function Tlm:destroy()

end

return Tlm