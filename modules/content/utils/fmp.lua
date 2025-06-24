
function CHAR.FUNC.fetch_most_played()
  local played_tab = {}
  local most_played = {}
  local max_val = -math.huge
  for k, v in pairs(G.GAME.hands) do
    played_tab[k] = v.played
  end -- This fetches a table that should be {"HAND" = INTEGER_THAT_REPRESENTS_AMNT_PLAYED}
  for _, v in pairs(played_tab) do
    if v > max_val then
      max_val = v
    end
  end


  for k, v in pairs(played_tab) do
    if v == max_val then
      most_played[k] = v
    end
  end
  mp_raw = get_key_for_value(most_played, max_val)

  return mp_raw
end