#https://leetcode.com/problems/maximum-product-of-word-lengths/

# @param {String[]} words
# @return {Integer}
def max_product(words)
  word_codes = words.collect{ |word| convert_to_code(word) }
  max_product = 0
  0.upto(words.length - 1) do |i|
    (i + 1).upto(words.length - 1) do |j|
      if word_codes[i] & word_codes[j] == 0
        product = words[i].length * words[j].length
        max_product = product if product > max_product
      end
    end
  end
  max_product
end

def convert_to_code(word)
  num = 0
  word.each_char do |c|
    bit = c.ord - 97
    num = set_bit(num, bit)
  end
  num
end

def set_bit(num, bit)
  num | 1 << bit
end

p max_product ["abcw","baz","foo","bar","xtfn","abcdef"]