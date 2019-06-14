# @param {String} s
# @return {Boolean}
def is_valid(s)
  while !s.empty?
    reduced_s = run_pass(s)
    return false if reduced_s == s
    s = reduced_s
  end
  true
end

def run_pass(s)
  idx = 0
  str = ''
  while idx < s.length
    if s[idx] == 'a' && idx < s.length - 2 && s[idx + 1] == 'b' && s[idx + 2] == 'c'
      idx += 3
    else
      str << s[idx]
      idx += 1
    end
  end
  str
end

# @param {String} s
# @return {Boolean}
def is_valid(s)
  stack = []
  s.each_char do |c|
    if c == "c" && stack[-1] == "b" && stack[-2] == "a"
      stack.pop
      stack.pop
    else
      stack.push(c)
    end
  end
  stack.empty?
end
p is_valid "aabcbc"
p is_valid "abcabcababcc"
p is_valid "abccba"