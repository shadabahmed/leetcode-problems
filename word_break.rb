require 'set'


class Trie
  attr_accessor :root
  def initialize(words)
    self.root = TrieNode.new
    words.each {|word| self.root.add_word(word)}
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

def path_exists(matrix, dp)
  return false if col >= dp.length
  return dp[col] if col == dp.length - 1
  (matrix[row] && matrix[row][col] && path_exists(matrix, col + 1, col + 1)) ||
  path_exists(matrix, row, col + 1)
end

def word_break(str, list)
  trie = Trie.new
  list.each {|word| trie.add_word(word)}
  dp = str.length.times.collect { false }
  trie_node = trie.root
  0.upto(str.length - 1) do |first|
    dp[first] = if trie_node
                   trie_node = trie_node.children[str[first]]
                   trie_node && trie_node.is_word
                 else
                   false
                 end
    end
  end
  !!path_exists(dp)
end

require 'pry'

def word_break_helper(str, trie_root, idx = 0)
  current_node = trie_root
  while current_node && idx < str.length
    current_node = current_node.children[str[idx]]
    if current_node && current_node.is_word
      return true if word_break_helper(str, trie_root, idx + 1)
    end
    idx += 1
  end
  !!(current_node && current_node.is_word)
end

def word_break(str, list)
  trie = Trie.new
  list.each {|word| trie.add_word(word)}
  word_break_helper(str, trie.root)
end


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


def word_break(str, list)
  trie = Trie.new(list)
  dp = [true]
  1.upto(str.length) do |idx|
    dp[idx] = 0.upto(idx - 1).any? do |other_idx|
                dp[other_idx] && trie.search(str, other_idx, idx - 1)
              end
  end
  dp[str.length]
end

word_break "applepenapple", ["apple", "pen"]
