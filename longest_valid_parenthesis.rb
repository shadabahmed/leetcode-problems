require 'pry'

def longest_valid_parentheses(s)
  max_len, stack = 0, []
  last_start_idx = -1
  0.upto(s.length - 1) do |idx|
    if s[idx] == '('
      if last_start_idx >= 0
        stack.push(last_start_idx)
      else
        stack.push(idx)
      end
      last_start_idx = -1
    else
      if !stack.empty?
        starting_idx = stack.pop
        len = idx - starting_idx + 1
        last_start_idx = starting_idx
        max_len = len if len > max_len
      else
        last_start_idx = -1
      end
    end
  end
  max_len
end

def longest_valid_parentheses(s)
  stack = [-1]
  max_len = 0
  0.upto(s.length - 1) do |idx|
    if s[idx] == '('
      stack.push(idx)
    else
      if !stack.empty?
        stack.pop
        max_len = idx - stack.last if !stack.empty? && idx - stack.last > max_len
      end
      stack.push(idx) if stack.empty?
    end
  end
  max_len
end
longest_valid_parentheses "(()()"
longest_valid_parentheses "(((())))"
