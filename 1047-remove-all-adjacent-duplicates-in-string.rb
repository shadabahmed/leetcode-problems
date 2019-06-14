# @param {String} s
# @return {String}
def remove_duplicates(s)
  stack = []
  s.each_char do |c|
  if stack.last == c
    stack.pop while c == stack.last
  else      
    stack.push(c)
  end        
  end 
  stack.join
end

p remove_duplicates "abbaca"