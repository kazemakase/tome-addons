local class = require"engine.class"
local Birther = require "engine.Birther"

function loadHook(self, data)
	Birther:loadDefinition("/data-sapper/birth.lua")
end

class:bindHook("ToME:load", loadHook)
