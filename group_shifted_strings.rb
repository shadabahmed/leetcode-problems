def get_origin(str)
  return "" if str.empty?
  shift = str[0].ord - 97
  str.each_char.collect do |chr|
    new_ord = chr.ord - shift
    new_ord += 26 if new_ord < 97
    new_ord.chr
  end.join
end

# @param {String[]} strings
# @return {String[][]}
def group_strings(strings)
  group = {}
  strings.each do |str|
    key = get_origin(str)
    group[key] ||= []
    group[key] << str
  end
  group.values
end

p group_strings ["abc", "bcd", "acef", "xyz", "az", "ba", "a", "z"]
