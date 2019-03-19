# @param {Integer[]} tree
# @return {Integer}
def total_fruit(tree)
  fruit_types = Hash.new(0)
  left, right = 0, 0
  max_left, max_right = 0, 0
  while right < tree.length
    if fruit_types.length <= 2
      fruit_types[tree[right]] += 1
      right += 1
      max_left, max_right = left, right if fruit_types.length <= 2 && right - left > max_right - max_left
    else      
      fruit_types[tree[left]] -= 1
      fruit_types.delete(tree[left]) if fruit_types[tree[left]].zero?
      left += 1      
    end
  end
  max_right - max_left
end

p total_fruit [1,2,1]
p total_fruit [0,1,2,2]
p total_fruit [1,2,3,2,2]
p total_fruit  [3,3,3,1,2,1,1,2,3,3,4]