SMODS.Consumable({
	key = "sever",
	set = "ritual",
	atlas = CHAR.G.ritualatlas.key,
	pos = { x = 1, y = 0 },

	use = function(self, card, area, copier)
		local potential_victims = {}
		for i = 1, #G.jokers.cards do
			if G.jokers.cards[i]:can_calculate(true) and not G.jokers.cards[i].ability.eternal then
				table.insert(potential_victims, G.jokers.cards[i])
			end
		end

		local victim = pseudorandom_element(potential_victims, pseudoseed("I LOVE AMONG US"))
		if not victim then
			return
		end -- Safety check

		victim.getting_sliced = true
		G.GAME.joker_buffer = G.GAME.joker_buffer - 1

		-- Store reference in local variable for closure
		local dissolve_target = victim
		G.E_MANAGER:add_event(Event({
			trigger = "immediate",
			blockable = false,
			func = function()
				if dissolve_target and dissolve_target.start_dissolve then
					dissolve_target:start_dissolve()
				end
				G.GAME.joker_buffer = 0
				return true
			end,
		}))

		--[[So, funny shit here, consumables is misspelt in the code of the game, so just remember..]]
		local slots_available = G.consumeables.config.card_limit - #G.consumeables.cards
		if slots_available >= 2 then
			SMODS.add_card({ set = "ritual" })
			SMODS.add_card({ set = "ritual" })
		elseif slots_available == 1 then
			SMODS.add_card({ set = "ritual" })
		end
	end,

	can_use = function(self, card)
		local potential_victims = {}
		for i = 1, #G.jokers.cards do
			if G.jokers.cards[i]:can_calculate(true) and not G.jokers.cards[i].ability.eternal then
				table.insert(potential_victims, G.jokers.cards[i])
			end
		end
		return #potential_victims > 0 and #G.consumeables.cards < G.consumeables.config.card_limit
	end,
})
