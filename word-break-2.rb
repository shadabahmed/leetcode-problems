class TrieNode
  attr_accessor :is_word, :children
  def initialize
    self.is_word = false
    self.children = {}
  end
end

class Trie
  attr_accessor :root
  def initialize(words)
    self.root = TrieNode.new
    words.each {|word| self.add_word(word)}
  end

  def add_word(word)
    parent = root
    word.each_char do |chr|
      parent.children[chr] = TrieNode.new if !parent.children.key?(chr)
      parent = parent.children[chr]
    end
    parent.is_word = true
  end

  def search(str, first = 0, last = str.length - 1)
    parent = root
    first.upto(last) do |idx|
      return false unless parent.children.key?(str[idx])
      parent = parent.children[str[idx]]
    end
    parent.is_word
  end
end

def word_break(str, list)
  trie = Trie.new(list)
  indices = [0]
  0.upto(str.length - 1) do |last|
    indices.each do |first|
      if trie.search(str, first, last)
        indices.push(last + 1)
      end
    end
  end
  indices.last == str.length
end


def get_words(str, word_breaks)
  res = []
  word_breaks.each do |wb|
    str_arr = []
    0.upto(str.length - 1) do |idx|
      str_arr.push(str[idx])
      if idx < str.length - 1 && (1 << idx & wb) > 0
        str_arr.push(' ')
      end
    end
    res.push(str_arr.join)
  end
  res
end

def word_break(str, list)
  trie = Trie.new(list)
  dp = [[0]]
  1.upto(str.length) do |idx|
    dp[idx] = []
    0.upto(idx - 1) do |other_idx|
      if !dp[other_idx].empty? && trie.search(str, other_idx, idx - 1)
        dp[other_idx].each do |num|
          dp[idx].push(num | 1 << (idx - 1))
        end
      end
    end
  end
  get_words(str, dp[str.length])
end

word_break "applepenapple", ["apple", "pen"]
word_break "catsanddog", ["cat","cats","and","sand","dog"]
