SMODS.Enhancement {
	key = "purified",
	loc_txt = {

	},
	config = { extra = { chips = 30, mult = 4, hih_xmult = 1.5 } },
	atlas = CHAR.G.enhancementatlas.key,
	pos = { x = 2, y = 0 },
	loc_vars = function(self, info_queue, card)
		return { vars = { card.ability.extra.chips, card.ability.extra.mult, card.ability.extra.hih_xmult } }
	end,
	calculate = function(self, card, context)
		if context.main_scoring and context.cardarea == G.hand then
			return {
				xmult = card.ability.extra.hih_xmult
			}
		end
		if context.main_scoring and context.cardarea == G.play then
			return {
				chips = card.ability.extra.chips,
				mult = card.ability.extra.mult,
			}
		end
	end
}
