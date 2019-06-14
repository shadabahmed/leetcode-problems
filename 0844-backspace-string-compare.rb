# @param {String} s
# @param {String} t
# @return {Boolean}
def backspace_compare(s, t)
  s_stack = []
  t_stack = []
  s.each_char do |c|
    if c == '#'
      s_stack.pop
    else
      s_stack.push(c)
    end
  end

  t.each_char do |c|
    if c == '#'
      t_stack.pop
    else
      t_stack.push(c)
    end
  end

  s_stack.join == t_stack.join
end