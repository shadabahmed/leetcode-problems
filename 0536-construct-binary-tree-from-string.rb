# Definition for a binary tree node.
class TreeNode
    attr_accessor :val, :left, :right
    def initialize(val)
        @val = val
        @left, @right = nil, nil
    end
end

# @param {String} s
# @return {TreeNode}
def str2tree(s, start_idx = 0, end_idx = s.length - 1)
  return nil if start_idx > end_idx
  current_val = ''
  while s[start_idx] != '(' && start_idx <= end_idx
    current_val << s[start_idx]
    start_idx += 1
  end
  return nil if current_val.empty?
  root = TreeNode.new(current_val)
  if start_idx + 1 < end_idx
    left_end_idx = find_matching_end_idx(s, start_idx, end_idx)
    root.left = str2tree(s, start_idx + 1, left_end_idx - 1)
    root.right = str2tree(s, left_end_idx + 2, end_idx - 1)
  end  
  root
end

def find_matching_end_idx(s, start_idx, end_idx)
  num_brackets = 0
  while start_idx <= end_idx    
    if s[start_idx] == '('
      num_brackets += 1
    elsif s[start_idx] == ')'
      num_brackets -= 1
    end
    return start_idx if num_brackets.zero?
    start_idx += 1
  end
end

p str2tree "4(2(3)(1))(6(5))"