# @param {String[]} a
# @param {String[]} b
# @return {String[]}
def word_subsets(a, b)
  max_letters_map = create_max_letters_map(b)
  a.select do |word|
    is_subset?(create_letter_map(word), max_letters_map)
  end    
end

def is_subset?(a, b)
  b.all? do |letter, count|
    a[letter] >= count
  end
end

def create_max_letters_map(words)
  map = Hash.new(0)
  words.each do |word|
    letter_map = create_letter_map(word)
    letter_map.each do |letter, count|
      map[letter] = count if map[letter] < count
    end
  end
  map
end

def create_letter_map(word)
  map = Hash.new(0)
  word.each_char do |char|
    map[char] += 1
  end
  map
end

A = ["amazon","apple","facebook","google","leetcode"]
B = ["e","o"]
B = ["ec","oc","ceo"]
p word_subsets A, B