
def longest_consecutive(root, length = 1, parent_diff = nil)
  return length - 1 if root.nil?

  left_length = if root.left.nil?
                  length + 1
                elsif (root.val - root.left.val).abs == 1
                  if
                else
                  0
                end
  left_max = longest_consecutive(root.left, )

  if root.right
  end

  []
end
