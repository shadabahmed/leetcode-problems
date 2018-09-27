def first_uniq_char(s)
  uniq_dict = {}
  repeated_dict = {}
  0.upto(s.length - 1) do |idx|
    char = s[idx]
    if uniq_dict.key?(char)
      repeated_dict[char] = uniq_dict.delete(char)
    elsif !repeated_dict.key?(char)
      uniq_dict[char] = idx
    end
  end
  uniq_dict.values.sort.first || - 1
end

def first_uniq_char(s)
  char_dict = Hash.new{|h,k| h[k] = 0}
  idx_dict = {}
  0.upto(s.length - 1) do |idx|
    char = s[idx]
    idx_dict[char] = idx unless idx_dict.key?(char)
    char_dict[idx_dict[char]] += 1
  end
  0.upto(s.length - 1) do |idx|
    return idx if char_dict[idx] == 1
  end
  -1
end

def first_uniq_char(s)
  char_dict = Hash.new{|h,k| h[k] = 0}
  s.each_char do |char|
    char_dict[char] += 1
  end
  0.upto(s.length - 1) do |idx|
    return idx if char_dict[idx] == 1
  end
  -1
end

p first_uniq_char 'eetcode'
