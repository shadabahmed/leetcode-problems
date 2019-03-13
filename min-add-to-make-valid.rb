# @param {String} s
# @return {Integer}
def min_add_to_make_valid(s)
  stack = []
  s.each_char do |c|
    if c == ')' && stack.last == '('
      stack.pop
    else
      stack.push(c)
    end
  end    
  stack.length
end

p min_add_to_make_valid "())"
p min_add_to_make_valid "()))(("
p min_add_to_make_valid "((("