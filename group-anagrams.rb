def group_anagrams(strs)
  group_map = {}
  strs.each do |str|
    key = str.chars.sort
    group_map[key] ||= []
    group_map[key] << str
  end
  group_map.values
end



# @param {String[]} strs
# @return {String[][]}
def group_anagrams(strs)
  map = {}
  strs.each do |str|
    key = str.chars.sort.join
    map[key] ||= []
    map[key] << str
  end    
  map.values
end

p group_anagrams  ["eat", "tea", "tan", "ate", "nat", "bat"]