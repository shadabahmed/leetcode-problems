def valid_square?(stack, idx)
  return true if idx == 0
  0.upto(idx).all? do |other_idx|
    stack[idx][other_idx] == stack[other_idx][idx]
  end
end

def word_squares(words, idx = 0, stack = [], res = [])
  return res.push(stack.clone) if idx >= words.first.length
  words.each do |word|
    stack[idx] = word
    next unless valid_square?(stack, idx)
    word_squares(words, idx + 1, stack, res)
  end
  res
end

def word_squares(words, trie = build_trie(words), idx = 0, stack = [], res = [])
  return res.push(stack.clone) if idx >= words.first.length
  find_matches(stack, idx, trie).each do |word|
    stack[idx] = word
    word_squares(words, trie, idx + 1, stack, res)
  end
  res
end

def find_matches(stack, idx, trie)
  root = trie
  0.upto(idx - 1) do |row_idx|
    chr = stack[row_idx][idx]
    return [] unless root.key?(chr)
    root = root[chr]
  end
  get_matches_from(root)
end

def get_matches_from(node, res = [])
  return res.push(node) if node.is_a?(String)
  node.each_key do |chr|
    get_matches_from(node[chr], res)
  end
  res
end

def build_trie(words)
  root = {}
  words.each do |word|
    parent = root
    0.upto(word.length - 1) do |chr_idx|
      chr = word[chr_idx]
      if chr_idx == word.length - 1
        parent[chr] = word
      else
        parent[chr] ||= {}
        parent = parent[chr]
      end
    end
  end
  root
end

p word_squares ["area","lead","wall","lady","ball"]
