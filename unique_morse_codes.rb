CODES = [".-","-...","-.-.","-..",".","..-.","--.","....","..",".---","-.-",".-..","--","-.","---",".--.","--.-",".-.","...","-","..-","...-",".--","-..-","-.--","--.."]
# @param {String[]} words
# @return {Integer}
def unique_morse_representations(words)
  trie = Trie.new
  words.each do |word|
    rep = ''
    word.each_char do |chr|
      rep << CODES[chr.ord - 97]
    end
    trie.add_word(rep)
  end    
  trie.find_words
end

class Trie
  attr_accessor :children, :is_word
  def initialize
    self.children = {}
  end

  def add_word(word, current = self, idx = 0)        
    if idx < word.length
      current.children[word[idx]] ||= Trie.new
      add_word(word, current.children[word[idx]], idx + 1) 
    else
      current.is_word = true
    end    
  end

  def find_words(current = self)
    current_count = current.is_word ? 1 : 0
    current.children.each do |letter, child|
      current_count += find_words(child)       
    end
    current_count
  end
end

p unique_morse_representations ["yxmine","yxzd","eljys","uiaopi","pwlk"]