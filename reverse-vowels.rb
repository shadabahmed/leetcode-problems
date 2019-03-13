require 'set'
VOWELS = Set.new(%w[a e i o u A E I O U])

# @param {String} s
# @return {String}
def reverse_vowels(s)
  left, right = 0, s.length - 1
  while left < right
    if VOWELS.include?(s[left]) && VOWELS.include?(s[right])
      s[left], s[right] = s[right], s[left]
    elsif VOWELS.include?(s[left])
      left -= 1
    elsif VOWELS.include?(s[right])
      right += 1
    end
    left += 1
    right -= 1    
  end
  s
end

p reverse_vowels "leetcode"
p reverse_vowels "aA"