# https://leetcode.com/problems/substring-with-concatenation-of-all-words/

class SuffixTree
  class Node 
    attr_accessor :children
    def initialize(idx)
      self.children = {}
    end
  end

  def initialize(str)
    root = Node.new
    0.upto(str.length - 1) do |start_idx|
      node = root
      start_idx.upto(str.length - 1) do |idx|
        node.children[str[idx]] ||= Node.new
        node = node.children[str[idx]]
      end
      node.children['$'] = idx
    end
  end
end

# @param {String} s
# @param {String[]} words
# @return {Integer[]}
def find_substring(s, words)
    
end