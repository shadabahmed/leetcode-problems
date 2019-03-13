class Node
  attr_accessor :letter, :children, :is_word
  def initialize(letter = nil)
    @is_word = false
    @letter = letter
    @children = []
  end
end

class Trie
  A_ORD = 'a'.ord
  attr_accessor :root

  def initialize()
    @root = Node.new
  end

  def insert_word(word)
    node = root
    word.chars.each_with_index do |chr, idx|
      idx = chr.ord - A_ORD
      node.children[idx] ||= Node.new(chr)
      node = node.children[idx]
    end
    node.is_word = true
  end

  def longest_word(node = self.root, path = [], max_word = '')
    return '' if node.nil?
    path.push(node.letter)
    max_word = path.join('') if path.length > max_word.length + 1
    node.children.each do |child_node|
      max_word = longest_word(child_node, path, max_word) if child_node&.is_word
    end
    path.pop
    max_word
  end
end

def longest_word(words)
  tr = Trie.new
  words.each {|word| tr.insert_word(word) }
  tr.longest_word
end
