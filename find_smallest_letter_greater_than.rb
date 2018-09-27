# @param {Character[]} letters
# @param {Character} target
# @return {Character}
def next_greatest_letter(letters, target)
  first, last = 0, letters.size
  while first < last
    mid = (first + last) / 2
    if letters[mid] <= target
      first = mid + 1
    elsif letters[mid] > target
      last = mid
    end
  end
  letters[first % letters.length]
end

p next_greatest_letter ["c", "f", "j"], "c"
p next_greatest_letter ["c", "f", "j"], "k"
p next_greatest_letter ["c", "f", "j"], "d"
p next_greatest_letter ["c", "f", "j"], "j"
