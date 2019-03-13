# https://leetcode.com/problems/substring-with-concatenation-of-all-words/ 

class Trie
  attr_accessor :root
  class Node
    attr_accessor :children, :index
    def initialize()
      self.children = {}
      self.index = -1
    end
  end

  def initialize(words = [])
    self.root = Node.new
    words.each_with_index do |word, idx|
      add_word(word, idx)
    end
  end

  def add_word(word, index)
    node = self.root
    0.upto(word.length - 1) do |idx|
      node.children[word[idx]] ||= Node.new
      node = node.children[word[idx]]
    end
    node.index = index
  end

  def search_word(word, idx, len)
    node = root
    max_idx = [idx + len, word.length].min
    while idx < max_idx && node
      node = node.children[word[idx]]
      idx += 1
      return -1 if node.nil?
      return node.index if node.index >= 0 && !node.children[word[idx]]
    end
    -1
  end 
end

def get_search_map(trie, words, s)  
  len, search_map = words.first.length, {}
  0.upto(s.length - 1) do |idx|
    matching_word_index = trie.search_word(s, idx, len)
    if matching_word_index >= 0
      search_map[idx] = matching_word_index
    end
  end  
  search_map
end

# @param {String} s
# @param {String[]} words
# @return {Integer[]}
def find_substring(s, words)
  res, idx = [], 0
  return res if words.empty?
  len = words.first.length
  trie = Trie.new(words)
  search_map = get_search_map(trie, words, s)
  0.upto(s.length - 1) do |idx|
    next unless search_map.key?(idx)
    word_set = Set.new
    current_idx = idx
    words.length.times do
      break unless search_map.key?(current_idx) || word_set.include?(current_idx)
      word_set << search_map[current_idx]
      current_idx += len
    end
    res.push(idx) if word_set.length == words.length
  end
  res
end

s = "barfoothefoobarman"
words = ["foo","bar"]
s = "barfoofoobarthefoobarman"
words = ["bar","foo","the"]

p find_substring s, words