# @param {String[]} words
# @param {String} order
# @return {Boolean}
def is_alien_sorted(words, order)
  order_map = {}
  0.upto(order.length - 1) do |idx|
    order_map[order[idx]] = idx
  end

  1.upto(words.length - 1) do |idx|
    return false unless lexically_smaller?(words[idx - 1], words[idx], order_map)
  end
  true
end

def lexically_smaller?(word1, word2, order_map)
  idx1, idx2 = 0, 0
  while idx1 < word1.length && idx2 < word2.length
    if order_map[word1[idx1]] == order_map[word2[idx2]]
      idx1 += 1
      idx2 += 1
    else
      return order_map[word1[idx1]] < order_map[word2[idx2]]
    end
  end
  word1.length < word2.length
end