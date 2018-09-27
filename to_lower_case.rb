# @param {String} str
# @return {String}
def to_lower_case(str)
  0.upto(str.length - 1) do |idx|
    str[idx] = (str[idx].ord  + 32).chr
  end
  str
end

p to_lower_case 'AAABBBCCC'