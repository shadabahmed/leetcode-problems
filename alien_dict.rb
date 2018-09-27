def create_incoming_edge_map(words)
  edges = {}
  0.upto(words.length - 2) do |idx|
    current_word = words[idx]
    next_word = words[idx + 1]
    c_idx = 0
    edges[current_word[c_idx]] ||= {}
    while next_word[c_idx] == current_word[c_idx] && c_idx < current_word.length - 1 && c_idx < next_word.length - 1
      edges[current_word[c_idx]] ||= {}
      c_idx += 1
    end
    edges[current_word[c_idx]] ||= {}
    edges[next_word[c_idx]] ||= {}
    next if next_word[c_idx] == current_word[c_idx]
    edges[next_word[c_idx]][current_word[c_idx]] = true
  end
  edges
end

def alien_order(words)
  edge_map = create_incoming_edge_map(words)
  order = []
  while !edge_map.empty?
    zero_inoder_node, _ = edge_map.find { |(k, v)| v.length.zero? }
    return order.join if zero_inoder_node.nil?
    order.push(zero_inoder_node)
    edge_map.delete(zero_inoder_node)
    edge_map.each do |_, v|
      v.delete(zero_inoder_node)
    end
  end
  order.join("")
end

def create_incoming_edge_map(words)
  edge_map = {}
  words.each do |word|
    word.each_char do |char|
      edge_map[char] = {}
    end
  end
  0.upto(words.length - 2) do |idx|
    (idx + 1).upto(words.length - 1) do |other_idx|
      current_word = words[idx]
      next_word = words[other_idx]
      c_idx = 0
      while current_word[c_idx] == next_word[c_idx] && c_idx < current_word.length - 1 && c_idx < next_word.length - 1
        c_idx += 1
      end
      if current_word[c_idx] != next_word[c_idx]
        edge_map[next_word[c_idx]][current_word[c_idx]] = true
      end
    end
  end
  edge_map
end

def alien_order(words)
  edge_map = create_incoming_edge_map(words)
  res = ""
  p edge_map
  while !edge_map.empty?
    zero_inorder_node = edge_map.keys.find { |k| edge_map[k].empty? }
    return "" if zero_inorder_node.nil?
    edge_map.delete(zero_inorder_node)
    res << zero_inorder_node
    edge_map.each do |_, v|
      v.delete(zero_inorder_node)
    end
  end
  res
end

# p alien_order(%w[z x])
# p alien_order(%w[z z])
#
# p alien_order(%w[zy zx])
p alien_order(%w[ab bc cd])
p alien_order [
                "wrt",
                "wrf",
                "er",
                "ett",
                "rftt",
              ]
p create_incoming_edge_map %w[z x z]
