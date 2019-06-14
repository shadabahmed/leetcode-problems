# @param {Integer[]} deck
# @return {Integer[]}
def deck_revealed_increasing(deck)
  deck.sort!  
  res = [deck.pop]
  while !deck.empty?
    res.unshift(res.pop)
    res.unshift(deck.pop)
  end
  res
end

p deck_revealed_increasing [17,13,11,2,3,5,7]