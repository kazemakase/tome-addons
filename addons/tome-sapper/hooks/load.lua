local class = require"engine.class"
local Birther = require "engine.Birther"
local ActorTalents = require "engine.interface.ActorTalents"

function loadHook(self, data)
	Birther:loadDefinition("/data-sapper/birth.lua")
    ActorTalents:loadDefinition("/data-sapper/talents.lua")
end

class:bindHook("ToME:load", loadHook)
