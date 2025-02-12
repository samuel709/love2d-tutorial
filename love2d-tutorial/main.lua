Renderer = require "tools/renderer"
GameLoop = require "tools/gameLoop"
local tlm = require "tools/tlm"

local rect = require "objects/rect"
local entity = require "objects/entity"

renderer = Renderer:create()
gameLoop = GameLoop:create()

g_Width = love.graphics.getWidth()
g_Height = love.graphics.getHeight()

g_GameTime = 0


function love.load()
    tlm:load()
    tlm:loadmap("level_1")
    -- gameLoop:load()
    -- renderer:load()
end

function love.update(dt)
    g_GameTime = g_GameTime + dt

    gameLoop:update(dt)
end

function love.draw()
    renderer:draw()
end
