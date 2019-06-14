# @param {String} s
# @return {Integer}
def score_of_parentheses(s)
  stack = []
  s.each_char do |c|
    if c == ')'      
      if stack.top == '('
        stack.push(1)
      elsif
        score = stack.pop
        stack.pop
        score *= 
      end
  end    
end