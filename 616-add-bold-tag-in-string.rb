# @param {String} s
# @param {String[]} dict
# @return {String}
def add_bold_tag(s, dict)
  stack = [[0, s.length - 1, false]]
  dict.each do |word|
    current_start = s.rindex(word)
    next if current_start.nil?
    current_end = current_start + word.length - 1
    if !stack.empty?
      last_start, last_end, bold = stack.pop
      if current_start <= last_end + 1
        if bold
          current_start = last_start
        elsif last_start < current_start
          stack.push([last_start, current_start - 1, false])
        end
      else        
        stack.push([last_start, last_end, true])
        stack.push([last_end + 1, current_start - 1, false])
      end
    end
    stack.push([current_start, current_end, true])
  end
  if stack.empty? || stack.last[1] < s.length - 1    
    stack.push([stack.last[1] + 1, s.length - 1, false])
  end
  stack.collect do |first, last, bold|
    str = bold ? '<b>' : ''
    str << s[first..last]
    str << '</b>' if bold
    str
  end.join
end

s = "aaabbcc"
dict = ["aaa","aab","bc"]

s = "aaaa"
dict = ["aaa","aab","bc"]

# s = "abcxyz123"
# dict = ["abc","123"]

s = "aaabbcc"
dict = ["d"]
s = "aaabbcc"
dict = ["a","b","c"]
p add_bold_tag s, dict