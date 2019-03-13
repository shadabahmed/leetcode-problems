class Solution
  attr_accessor :max_path_sum

  def get_max_path_sum(root)
    return 0 if root.nil?
    self.max_path_sum = root.val
    max_path_sum_helper(root)
    max_path_sum
  end

  def max_path_sum_helper(root)
    return 0 if root.nil?
    max_at_root = root.val
    left_max_sum = max_path_sum_helper(root.left)
    right_max_sum = max_path_sum_helper(root.right)
    max_at_root += left_max_sum if left_max_sum.positive?
    max_at_root += right_max_sum if right_max_sum.positive?
    self.max_path_sum = [max_path_sum, max_at_root].max
    max_at_root
  end
end

def max_path_sum(root)
  Solution.new.get_max_path_sum(root)
end
