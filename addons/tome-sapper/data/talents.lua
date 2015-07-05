
newTalentType{
    type = "cunning/firestarter", name = "Fire affinity", description = "Master the fiery element and cunningly bend it to your will.",
    allow_random=true, no_silence=true, is_spell=true, mana_regen=true, generic = true
}

newTalent{
	name = "Combustion",
	type = {"cunning/firestarter", 1},
	image = "talents/irresistible_sun.png",
	require = spells_req1,
	mode = "passive",
	points = 5,

    getPower = function(self, t) return self:combatTalentScale(t, 0, 100) end,

	passives = function(self, t, p)
        self:talentTemporaryValue(p, "inc_damage", {[DamageType.FIRE]=t.getPower(self, t)})
	end,

	info = function(self, t)
		return ([[Increases all fire damage by %d%%. (TODO: lower passive effect and add active effect that scales with cunning?)]]):
		format(t.getPower(self, t))
	end,
}

newTalent{
	name = "Fire protection",
	type = {"cunning/firestarter", 1},
	image = "talents/irresistible_sun.png",
	require = spells_req2,
	mode = "passive",
	points = 5,

    getResist = function(self, t) return self:combatTalentScale(t, 0, 30) end,

	passives = function(self, t, p)
		self:talentTemporaryValue(p, "resists",{[DamageType.FIRE]=t.getResist(self, t)})
	end,

	info = function(self, t)
		return ([[Grants %d%% fire resistance. (TODO: lower passive effect and add active effect that scales with cunning?)]]):
		format(t.getResist(self, t))
	end,
}
