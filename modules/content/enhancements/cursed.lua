SMODS.Enhancement {
	key = "cursed",
	config = { extra = { ttk = 3 } },
	atlas = CHAR.G.enhancementatlas.key,
	pos = { x = 1, y = 0 },
	loc_vars = function(self, info_queue, card)
		return { vars = { card.ability.extra.ttk } }
	end,

	calculate = function(self, card, context)
		if context.main_scoring and context.cardarea == G.play then
			-- alright, so i need to figure out how to debuff the card after 3 turns.
			if card.ability.extra.ttk > 0 then
				card.ability.extra.ttk = card.ability.extra.ttk - 1
				return { message = card.ability.extra.ttk .. "..." }
			else
				G.E_MANAGER:add_event(Event({
					trigger = 'after',
					delay = 0.2,
					blockable = true,
					blocking = false,
					func = function()
						SMODS.debuff_card(card, true, card)
						return true
					end
				}))
				return { message = "Cursed!" }
			end
		end
	end

}
