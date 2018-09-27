# Given a 2D board and a list of words from the dictionary, find all words in the board.
#
# Each word must be constructed from letters of sequentially adjacent cell, where "adjacent" cells are those horizontally or vertically neighboring. The same letter cell may not be used more than once in a word.
#
# For example,
# Given words = ["oath","pea","eat","rain"] and board =
#
# [
#   ['o','a','a','n'],
#   ['e','t','a','e'],
#   ['i','h','k','r'],
#   ['i','f','l','v']
# ]
# Return ["eat","oath"].
# Note:
# You may assume that all inputs are consist of lowercase letters a-z.
#
require 'set'
require 'pry'
class Node
  attr_accessor :is_word, :children
  def initialize(is_word = false, children = {})
    self.is_word = is_word
    self.children = children
  end

  alias is_word? is_word
end

def build_trie(words)
  trie = Node.new
  words.each do |word|
    parent = trie
    0.upto(word.length - 1) do |idx|
      parent.children[word[idx]] ||= Node.new
      parent = parent.children[word[idx]]
      parent.is_word ||= idx == word.length - 1
    end
  end
  trie
end

def find_word_starting_at(board, trie, row, col, visited = Set.new, path, res)
  return res if board.size.zero? || row >= board.size || col >= board.first.size || row < 0 || col < 0
  current_letter = board[row][col]
  if matching_node = trie.children[current_letter]
    visited.add([row, col])
    path.push(current_letter)
    if matching_node.is_word?
      
    end
    [[1, 0], [-1, 0], [0, 1], [0, -1]].each do |(row_inc, col_inc)|
      new_row, new_col = row + row_inc, col + col_inc
      next if visited.include?([new_row, new_col])
      find_word_starting_at(board, matching_node, new_row, new_col, visited, path, res)
    end
    path.pop
    visited.delete([row, col])
  end
  res
end

def find_words(board, words)
  trie = build_trie(words)
  res = Set.new
  0.upto(board.size - 1) do |row|
    0.upto(board[row].size - 1) do |col|
      find_word_starting_at(board, trie, row, col, Set.new, [], res)
    end
  end
  res.to_a
end

#p build_trie ["aba","baa","bab","aaab","aaa","aaaa","aaba"]
p find_words [["a","b","c"],["a","e","d"],["a","f","g"]], ["abcdefg","gfedcbaaa","eaabcdgfa","befa","dgc","ade"]
#p find_words [["a","b"],["a","a"]], ["aba","baa","bab","aaab","aaa","aaaa","aaba"]
# p find_words [["a","b"],["c","d"]], ["ab","cb","ad","bd","ac","ca","da","bc","db","adcb","dabc","abb","acb"]
#p find_words [['a','a']], ["aaa"]
#p find_words [['o','a','a','n'],['e','t','a','e'],['i','h','k','r'],['i','f','l','v']], ["oath","pea","eat","rain"]
#p build_trie ["ab","cb","ad","bd","ac","ca","da","bc","db","adcb","dabc","abb","acb"]
