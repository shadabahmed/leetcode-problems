class WordDictionary

  attr_accessor :children, :is_word
  def initialize()
    @children = {}
    @is_word = false
  end


  def add_word(word)
    parent, idx = self, 0
    word.chars.each do |chr|
      parent.children[chr] ||= self.class.new
      parent = parent.children[chr]
    end
    parent.is_word = true
  end

  def search(word, parent = self, idx = 0)
    while idx < word.length
      if word[idx] == '.'
        return parent.children.values.any? do |v|
          if idx < word.length - 1
            search(word, v, idx + 1)
          else
            v.is_word
          end
        end
      else
        return false unless parent.children.key?(word[idx])
        parent = parent.children[word[idx]]
      end
      idx += 1
    end
    parent.is_word
  end
end


%w[addWord addWord addWord addWord search search addWord search search search searchsearch search].zip(%w[at and an add a .at bat .at an. a.d. b. a.d .])

@trie = WordDictionary.new
%w[bat].each do |word|
  @trie.add_word(word)
end
#,[".ad b.."]
# %w[b. a.d . a..]
%w[b..].each do |word|
  p @trie.search(word)
end
