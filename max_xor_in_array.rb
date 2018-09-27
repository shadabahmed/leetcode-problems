class Trie

  attr_accessor :children, :num
  def initialize()
    @children = {}
  end


  def add(num)
    word = num.to_s(2)
    parent, idx = self, 0
    while idx < word.length
      key = "#{word[idx]}#{word.length - idx}"
      parent.children[key] ||= self.class.new
      parent = parent.children[key]
      idx += 1
    end
    parent.num = num
  end

  def search(num, idx = 0)
    parent = self
    word = num.to_s(2)
    while idx < word.length
      len = word.length - idx
      keys = ["1#{len}", "0#{len}"]
      keys.reverse! if word[idx] == '1'
      valid_key = keys.find { |key| parent.children.key?(key) }
      return if valid_key.nil?
      parent = parent.children[valid_key]
      idx += 1
    end
    parent.num
  end

  def max_xor(num)
    word = num.to_s(2)
    idx = 0
    idx += 1 while word[idx] == '1'
    idx.upto(word.length - 1) do |idx|
      other_num = search(num, idx)
      return num ^ other_num if other_num
    end
    idx.downto(0) do |idx|
      other_num = search(num, idx)
      return num ^ other_num if other_num
    end
  end
end


def find_maximum_xor(nums)
  trie = Trie.new
  nums.each do |num|
    trie.add(num)
  end
  trie.max_xor(nums.max)
end

t = Trie.new
[3, 10, 5, 25, 2, 8].each {|num| t.add(num)}
t.max_xor(25)
