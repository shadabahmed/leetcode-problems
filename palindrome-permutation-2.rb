
# @param {String} s
# @return {String[]}
def generate_palindromes(s, idx = 0, res = [])
  return res.push(s.clone) if idx >= s.length - 1 && is_palindrome?(s) && !res.include?(s)
  return res if idx >= s.length - 1
  idx.upto(s.length - 1) do |s_idx|
    s[idx], s[s_idx] = s[s_idx], s[idx]
    generate_palindromes(s, idx + 1, res)
    s[idx], s[s_idx] = s[s_idx], s[idx]
  end
  res
end

def is_palindrome?(s)
  low, high = 0, s.length - 1
  while low < high
    return false if s[low] != s[high]
    low += 1
    high -= 1    
  end
  true
end

# p generate_palindromes("aba")
# p generate_palindromes("aabb")




# @param {String} s
# @return {String[]}
def generate_palindromes(s, idx = 0, res = [])
  return res.push(s.clone) if idx >= s.length - 1 && is_palindrome?(s) && !res.include?(s)
  return res if idx >= s.length - 1
  idx.upto(s.length - 1) do |s_idx|
    s[idx], s[s_idx] = s[s_idx], s[idx]
    generate_palindromes(s, idx + 1, res)
    s[idx], s[s_idx] = s[s_idx], s[idx]
  end
  res
end

def is_palindrome?(s)
  low, high = 0, s.length - 1
  while low < high
    return false if s[low] != s[high]
    low += 1
    high -= 1    
  end
  true
end

def generate(s, map = generate_char_map(s), low = 0, high = s.length - 1, res = [])
  return res.push(s.clone) if low > high
  if low < high
    map.each do |chr, count|
      next if count < 2
      s[low], s[high] = chr, chr
      map[chr] = count - 2
      generate(s, map, low + 1, high - 1, res)
      map[chr] = count
    end
  elsif low == high
    map.each do |chr, count|
      next if count < 1
      s[low] = chr
      map[chr] = count - 1
      generate(s, map, low + 1, high - 1, res)
      map[chr] = count
    end  
  end
  res
end

def generate_char_map(s)
  map = Hash.new(0)
  s.each_char do |c|
    map[c] += 1    
  end
  map
end

# p generate_char_map("aabbhijkkjih")

# p generate("aabbhijkkjih", generate_char_map("aabbhijkkjih"))


p generate("abv")