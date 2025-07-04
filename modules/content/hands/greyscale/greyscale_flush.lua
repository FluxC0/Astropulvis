SMODS.PokerHand {
  key = "grayflush",
  mult = 7,
  chips = 50,
  l_mult = 3,
  l_chips = 15,
  example = {
    { 'S_K', true, edition = "e_charcuterie_bleached" },  -- King of Spades, does not score
    { 'H_9', true, edition = "e_charcuterie_bleached" },  -- 9 of Spades, scores
    { 'D_9', true, enhancement = 'm_stone' },             -- Negative Lucky 9 of Diamonds, scores
    { 'H_6', true, enhancement = 'm_stone' },             -- 6 of Hearts, does not score
    { 'D_3', true, edition = 'e_charcuterie_bleached' }   -- Red Seal 3 of Diamonds, does not score
  },
  evaluate = function(parts, hand)
    local suitless = {}
    for i, card in ipairs(hand) do
      if
          SMODS.has_no_suit(card)
      then
        suitless[#suitless + 1] = card
      end
    end
    return #suitless >= 5 and { suitless } or {}
  end,
}
