
local Particles = require "engine.Particles"

newBirthDescriptor{
	type = "subclass",
	name = "Sapper",
	desc = {
        "Sappers like to blow their foes up, or failing that, set them on ",
        "fire. Lacking constitution, they usually operate stealthily and try ",
        "to nimbly stay out of their opponent's reach.",
		"Their most important stats are: Magic and Cunning.",
		"#GOLD#Stat modifiers:",
		"#LIGHT_BLUE# * +0 Strength, +3 Dexterity, +0 Constitution",
		"#LIGHT_BLUE# * +3 Magic, +0 Willpower, +3 Cunning",
		"#GOLD#Life per level:#LIGHT_BLUE# +0",
	},
	power_source = {technique=true, arcane=true},
	stats = { mag=3, dex=3, cun=3, },
	birth_example_particles = {
		function(actor)
			actor:addShaderAura("body_of_fire", "awesomeaura", {time_factor=3500, alpha=1, flame_scale=1.1}, "particles_images/wings.png")
		end,
	},
	talents_types = {
		["spell/explosives"]={true, 0.3},
		["spell/fire-alchemy"]={true, 0.3},
		["spell/stone-alchemy"]={true, -0.3},
		["spell/fire"]={false, 0.3},
		["cunning/survival"]={false, 0.3},
		["technique/combat-training"]={true, 0.1},
		["technique/field-control"]={true, 0},
		["technique/combat-techniques-passive"]={false, 0.3},
		["technique/acrobatics"]={false, 0.3},
		["cunning/stealth"]={true, 0.3},
		["cunning/trapping"]={true, 0.3},
	},
	talents = {
		[ActorTalents.T_CREATE_ALCHEMIST_GEMS] = 1,
		[ActorTalents.T_THROW_BOMB] = 1,
		[ActorTalents.T_FIRE_INFUSION] = 1,
		[ActorTalents.T_STEALTH] = 1,
		[ActorTalents.T_TRAP_MASTERY] = 1,
	},
	copy = {
		max_life = 100,
		mana_regen = 0.25,
		mana_rating = 5,
		resolvers.inscription("RUNE:_MANASURGE", {cooldown=25, dur=10, mana=620}),
		resolvers.equipbirth{ id=true,
			{type="weapon", subtype="dagger", name="iron dagger", autoreq=true, ego_chance=-1000},
			{type="armor", subtype="light", name="rough leather armour", autoreq=true, ego_chance=-1000},
			{type="armor", subtype="head", name="iron helm", autoreq=true, ego_chance=-1000},
		},
		resolvers.inventory{ id=true,
			{type="gem",},
			{type="gem",},
			{type="gem",},
		},
		resolvers.generic(function(self) self:birth_create_alchemist_stuff() end),
		birth_create_alchemist_stuff = function(self)
			-- Make and wield some alchemist gems
			local t = self:getTalentFromId(self.T_CREATE_ALCHEMIST_GEMS)
			local gem = t.make_gem(self, t, "GEM_AGATE")
			self:wearObject(gem, true, true)
			self:sortInven()
		end,
	},
	copy_add = {
		life_rating = 0,
	},
}

getBirthDescriptor("class", "Rogue").descriptor_choices.subclass.Sapper = "allow"
