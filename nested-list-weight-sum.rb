# @param {NestedInteger[]} nested_list
# @return {Integer}
def depth_sum(nested_list, depth = 1)
  nested_list.reduce(0) do |sum, elem|
    if elem.is_a?(Array)
      sum += depth_sum(elem, depth + 1)
    else
      sum += elem * depth
    end
  end    
end

p depth_sum [[1,1],2,[1,1]]