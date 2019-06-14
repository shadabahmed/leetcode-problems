# @param {String} a
# @param {String} b
# @return {Boolean}
def buddy_strings(a, b)
  left, right, swapped = 0, a.length - 1, false    
  return false if a.length != b.length
  right -= 1 while right > left && a[right] == b[right]
  left += 1 while left < right && a[left] == b[left]
  (a[left] == b[right] && (left + 1).upto(right - 1).all?{|idx| a[idx] == b[idx]})
end


# @param {String} a
# @param {String} b
# @return {Boolean}
def buddy_strings(a, b)
  left, right, swapped = 0, a.length - 1, false    
  return false if a.length != b.length
  right -= 1 while right > a.length / 2 && a[right] == b[right]
  left += 1 while (left < right - 1)&& a[left] == b[left]
  (a[left] == b[right] && (left + 1).upto(right - 1).all?{|idx| a[idx] == b[idx]})
end

# @param {String} a
# @param {String} b
# @return {Boolean}
def buddy_strings(a, b)
  left, right, swapped = 0, a.length - 1, false    
  return false if a.length != b.length
  while left < right
    if a[left] == b[right]
      b[left], b[right] = b[right], b[left]
      swapped = true
      break
    end
    return false if a[left] != b[left] && a[right] != b[right]
    if a[left] == b[left]
      left += 1
    end
    if a[right] == b[right]
      right -= 1
    end
  end
  swapped && a == b
end


# @param {String} a
# @param {String} b
# @return {Boolean}
def buddy_strings(a, b)
  return false if a.length != b.length
  if a == b
    seen = Set.new
    a.each_char do |chr|
      return true if seen.include?(chr)
      seen.add(chr)
    end
    false
  else
    left, right= 0, a.length - 1
    right -= 1 while right > left && a[right] == b[right]
    left += 1 while left < right && a[left] == b[left]
    b[left], b[right] = b[right], b[left]
    a == b
  end
end
p buddy_strings  "aaaaaaabc", "aaaaaaacb"
p buddy_strings  "ac", "ab"
p buddy_strings  "ab", "ba"
p buddy_strings  "ab", "ab"
p buddy_strings  "aa", "aa"
p buddy_strings "abcd","badc"
p buddy_strings "abab","abba"



