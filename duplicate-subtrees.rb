require "./tree"

def merge_subtrees(root, left_subtree, right_subtree)
  merged = [root.val]

  left_idx = 0
  start_idx = 1
  while left_idx < left_subtree.size
    start_idx.upto(2 * start_idx - 1) do |idx|
      merged[idx] = left_subtree[left_idx]
      left_idx += 1
      break if left_idx >= left_subtree.size
    end
    start_idx = 2 * start_idx + 1
  end

  right_idx = 0
  start_idx = 2
  while right_idx < right_subtree.size
    start_idx.upto(2 * (start_idx - 1)) do |idx|
      merged[idx] = right_subtree[right_idx]
      right_idx += 1
      break if right_idx >= right_subtree.size
    end
    start_idx = 2 * start_idx + 1
  end

  merged
end

# @param {TreeNode} root
# @return {TreeNode[]}
def traverse_tree(root, res = [], duplicate_map = Hash.new(0))
  return "#" if root.nil?
  key = "#{root.val},#{traverse_tree(root.left, res, duplicate_map)},#{traverse_tree(root.right, res, duplicate_map)}"
  duplicate_map[key] += 1
  if duplicate_map[key] == 2
    res.push(root)
  end
  key
end

def find_duplicate_subtrees(root)
  res = []
  traverse_tree(root, res)
  res
end

root = Tree.create([1, 2, 3, 4, nil, 2, 4])
p find_duplicate_subtrees(root)
