def group_anagrams(strs)
  group_map = {}
  strs.each do |str|
    key = str.chars.sort
    group_map[key] ||= []
    group_map[key] << str
  end
  group_map.values
end
