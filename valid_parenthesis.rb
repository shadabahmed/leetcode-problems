def is_valid(s)
  stack = []
  s.each do |c|
    if c == '{' || c == '[' || c == '('
      stack.push(c)
    elsif (c == '}' && stack.last == '{') ||
          (c == ')' && stack.last == '(') ||
          (c == ']') && stack.last == '[')
      stack.pop
    else
      return false
    end
  end
  stack.empty?
end
