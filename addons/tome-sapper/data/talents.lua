
newTalentType{
    type = "cunning/fire-affinity", name = "Fire affinity", description = "Master the fiery element and cunningly bend it to your will.",
    allow_random=true, no_silence=true, is_spell=true, mana_regen=true
}

newTalent{
	name = "Fire protection",
	type = {"cunning/fire-affinity", 1},
	image = "talents/irresistible_sun.png",
	require = spells_req2,
	mode = "passive",
	points = 5,
	on_learn = function(self, t)
		self.resists[DamageType.FIRE] = (self.resists[DamageType.FIRE] or 0) + 3
	end,
	on_unlearn = function(self, t)
		self.resists[DamageType.FIRE] = self.resists[DamageType.FIRE] - 3
	end,
	info = function(self, t)
		return ([[Grants %d%% fire resistance. This effect should improve with your cunning, but does not yet :)]]):
		format(self:getTalentLevelRaw(t) * 3)
	end,
}
