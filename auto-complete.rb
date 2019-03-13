class Trie
    attr_accessor :hotness, :children

    def initialize
        @children = {}
        @hotness = 0
    end

    def add(word, val = 1)
        parent, idx = self, 0
        word.chars.each do |chr|
            parent.children[chr] ||= Trie.new
            parent = parent.children[chr]
        end
        parent.hotness += val
    end

    def get_words_from(node, stack, words = [])
      return words if node.nil?
      words.push([stack.join, node.hotness]) if node.hotness > 0
      node.children.each do |(k, v)|
        stack.push(k)
        get_words_from(v, stack, words)
        stack.pop
      end
      words
    end

    def find_matches(word)
      parent, idx = self, 0
      while idx < word.length
          parent = parent.children[word[idx]]
          return [] if parent.nil?
          idx += 1
      end
      get_words_from(parent, word.chars)
    end
end

class AutocompleteSystem
    attr_accessor :trie
=begin
    :type sentences: String[]
    :type times: Integer[]
=end
    def initialize(sentences, times)
      @q = ''
      @trie = Trie.new
      0.upto(sentences.length - 1) do |idx|
        @trie.add(sentences[idx], times[idx])
      end
    end

    def filter_top_3(matches)
      matches.sort! do |match1, match2|
        if match1[1] > match2[1]
          -1
        elsif match1[1] < match2[1]
          1
        else
          idx = 0
          while idx < match1[0].length && idx < match2[0].length && match1[0][idx].ord == match2[0][idx].ord
            idx += 1
          end
          if idx == match1.length || match1[0][idx].ord < match2[0][idx].ord
            -1
          else
            1
          end
        end
      end
      matches.slice(0, 3).collect(&:first)
    end
=begin
    :type c: Character
    :rtype: String[]
=end
    def input(c)
      if c == '#'
        @trie.add(@q)
        @q = ''
        []
      else
        @q << c
        filter_top_3(@trie.find_matches(@q))
      end
    end
end

as = AutocompleteSystem.new(["i love you", "island","ironman", "i love leetcode"], [5,3,2,2])
res = []
[["i"],[" "],["a"],["#"],["i"],[" "],["a"],["#"],["i"],[" "],["a"],["#"]].each do |c|
  res.push(as.input(c.first))
end
p res
p as.trie.children['i'].children[' '].children['a']
