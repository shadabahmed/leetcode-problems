# https://leetcode.com/problems/valid-parentheses/

# def is_valid(s)
#   stack = []
#   s.each do |c|
#     if c == '{' || c == '[' || c == '('
#       stack.push(c)
#     elsif (c == '}' && stack.last == '{') ||
#           (c == ')' && stack.last == '(') ||
#           (c == ']') && stack.last == '[')
#       stack.pop
#     else
#       return false
#     end
#   end
#   stack.empty?
# end

def is_valid(s)
  stack = []
  s.each_char do |c|
    if c == '(' || c == '[' || c == '{'
      stack.push(c)
    elsif (c == ']' && stack.last == '[') || (c == ')' && stack.last == '(') || (c == '}' && stack.last == '{')
      stack.pop
    else
      return false
    end
  end
  stack.empty?
end

p is_valid '()[]{}'
p is_valid "([)]"