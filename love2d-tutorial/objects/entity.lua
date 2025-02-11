local rect = require "objects/rect"
local vec2 = require "tools/vec2"

local Entity = {}

function Entity:new(x,y,w,h,id)

    local ent = rect:new(x,y,w,h)

    ent.vel = vec2:new(0,0)
    ent.dir = vec2:new(0,0)
    ent.speed = vec2:new(0,0)
    ent.id = id or "object"

    function ent:tick(dt) end
    function ent:load() end
    function ent:draw() end

    return ent
end

return Entity