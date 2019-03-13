require 'pry'

class Trie
  attr_accessor :is_word, :children, :index

  def initialize
    @children = {}
    is_word = false
  end

  def add(word, index)
    parent = self
    word.each_char do |char|
      parent.children[char] ||= self.class.new
      parent = parent.children[char]
    end
    parent.is_word = true
    parent.index = index
  end

  def rev_add(word, index)
    parent = self
    (word.length - 1).downto(0) do |idx|
      char = word[idx]
      parent.children[char] ||= self.class.new
      parent = parent.children[char]
    end
    parent.is_word = true
    parent.index = index
  end

  def search(word, parent = self, idx = 0, res = [])
    res.push(parent.index) if parent.is_word
    while idx < word.length
      break unless parent.children.key?(word[idx])
      parent = parent.children[word[idx]]
      res.push(parent.index) if parent.is_word
      idx += 1
    end
    if idx == word.length
      parent.children.each do |_, child|
        search(word, child, idx, res)
      end
    end
    res
  end

  def rev_search(word, parent = self, idx = word.length - 1, res = [])
    res.push(parent.index) if parent.is_word
    while idx >= 0
      break unless parent.children.key?(word[idx])
      parent = parent.children[word[idx]]
      res.push(parent.index) if parent.is_word
      idx -= 1
    end
    if idx == -1
      parent.children.each do |_, child|
        rev_search(word, child, idx, res)
      end
    end
    res
  end
end

def is_palindrome(word, left, right)
  while left < right
    return false unless word[left] == word[right]
    left += 1
    right -= 1
  end
  true
end

def check_if_remainder_palindrome(word1, word2)
  return true if word1.length == word2.length
  if word1.length > word2.length
    is_palindrome(word1, word2.length, word1.length - 1)
  elsif word1.length < word2.length
    is_palindrome(word2, 0, word2.length - word1.length - 1)
  end
end

def palindrome_pairs(words)
  res = []
  ftrie = Trie.new
  rtrie = Trie.new
  0.upto(words.length - 1) do |idx|
    ftrie.rev_search(words[idx]).each do |p_idx|
      if check_if_remainder_palindrome(words[p_idx], words[idx])
        res.push([p_idx, idx])
      end
    end

    rtrie.search(words[idx]).each do |p_idx|
      if check_if_remainder_palindrome(words[idx], words[p_idx])
        res.push([idx, p_idx])
      end
    end
    ftrie.add(words[idx], idx)
    rtrie.rev_add(words[idx], idx)
  end
  res
end

#p palindrome_pairs(["a","abc","aba",""])
# [[2, 3], [0, 3], [3, 2], [3, 0], [3, 1]]
# [[0,3],[3,0],[2,3],[3,2]]

p palindrome_pairs(["a","aa","aaa"])
#p palindrome_pairs(["abcd", "dcba", "lls", "s", "sssll"])
#p palindrome_pairs(["a", ""])
# [[1, 0], [0, 1], [2, 3], [4, 2], [3, 4]]
# [[0, 1], [1, 0], [3, 2], [2, 4]]
# [[0, 1], [1, 0], [3, 2], [2, 4], [4, 3]]
