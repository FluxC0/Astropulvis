SMODS.Consumable({
	key = "strike",
	set = "ritual",
	atlas = CHAR.G.ritualatlas.key,
	pos = { x = 3, y = 0 },


	use = function(self, card, area, copier)
		for i = 1, #G.hand.cards do
			G.hand.cards[i]:juice_up(0.1, 1)
			G.hand.cards[i]:set_ability("m_charcuterie_cursed")
			ease_dollars(5)
		end
	end,

	can_use = function(self, card)
		if G.STATE == G.STATES.SELECTING_HAND or G.STATES.SMODS_BOOSTER_OPENED then
			return true
		else
			return false
		end
	end,
})