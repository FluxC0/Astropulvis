SMODS.Joker {
	key = "bloatware",
	atlas = CHAR.G.jokeratlas.key,
	pos = {x=19,y=0},
	loc_txt = {

	},
	config = { extra = {xchips_and_mult = 3, odds = 10, amt_create = 2}},
	rarity = 2,
	cost = 5,
	blueprint_compat = true,
	loc_vars = function(self,info_queue,card)
		return {vars = {card.ability.extra.xchips_and_mult, (G.GAME.probabilities.normal or 1),card.ability.extra.odds,card.ability.extra.amt_create}}

	end,
	calculate = function(self,card,context)
		if context.joker_main then
			if pseudorandom('adopted fatty') < G.GAME.probabilities.normal / card.ability.extra.odds then
				for i=1, card.ability.extra.amt_create do 
				_card =  create_playing_card({})
				SMODS.debuff_card(_card,true,'perma_debuff_do_not_remove_or_I_will_kill_you_0-49583074569034576908374598')
				G.hand:emplace(_card)
				end
			end
			return {
				xchips = card.ability.extra.xchips_and_mult,
				xmult = card.ability.extra.xchips_and_mult
			}
		end
	end	
}