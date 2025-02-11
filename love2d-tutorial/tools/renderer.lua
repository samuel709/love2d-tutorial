--[[
I followed a YouTube video, and the guy didn't really explain how the code works. For him it was 
more about how he structures projects. I will attempt to explain this as I understand it.

Essentially, we're creating a Renderer object that is returned at the end of the file. Inside that
object we're creating a (lowercase) renderer.

renderer is a 2D array with a given number of layers (num_of_layers) and a number of objects inside 
each of those layers. We can add objects to be rendered using the renderer:addRenderer method.

The renderer's draw function loops through each layer and, for each object in that layer, the object's
draw function is called.

Finally, in our main.lua file, we call renderer:draw() inside the love.draw() function.
]]--


local Renderer = {}

local num_of_layers = 5
local insert = table.insert
local remove = table.remove

function Renderer:create()
    local renderer = {}

    renderer.drawers = {}
    for i = 0, num_of_layers do
        renderer.drawers[i] = {}
    end

    function renderer:addRenderer(obj,layer)
        local l = layer or 0
        insert(self.drawers[l],obj)
    end

    function renderer:draw()
        for layer = 0, #self.drawers do
            for draw = 0, #self.drawers[layer] do
                local obj = self.drawers[layer][draw]
                if obj ~= nil then
                    obj:draw()
                end
            end
        end
    end

    return renderer
end

return Renderer