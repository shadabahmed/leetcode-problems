class ValidWordAbbr

=begin
  :type dictionary: String[]
=end
  def initialize(dictionary)
    @map = {}
    dictionary.each do |word|
      @map[abbreviation(word)] ||= Set.new()
      @map[abbreviation(word)].add(word)
    end
  end

=begin
  :type word: String
  :rtype: Boolean
=end
  def is_unique(word)
    abbr = abbreviation(word)
    !@map.key?(abbr) || (@map[abbr].size == 1 && @map[abbr].include?(word))
  end

  def abbreviation(word)
    if word.length > 2
      "#{word[0]}#{word.length - 2}#{word[-1]}"
    else
      word
    end
  end
end

obj = ValidWordAbbr.new ["deer", "door", "cake", "card"]
#p obj.is_unique("dmar")

p obj.is_unique("dear")
p obj.is_unique("cart")
p obj.is_unique("cane")
p obj.is_unique("make")
# Your ValidWordAbbr object will be instantiated and called as such:
# obj = ValidWordAbbr.new(dictionary)
# param_1 = obj.is_unique(word)
