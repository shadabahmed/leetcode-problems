# @param {Integer[]} nums
# @param {Integer} a
# @param {Integer} b
# @param {Integer} c
# @return {Integer[]}
def sort_transformed_array(nums, a, b, c)
  fn = Proc.new {|x| x * x * a + b * x + c}
  comparator = Proc.new {|x, y| a < 0 ? x >= y : x <= y}
  idx = find_mid_pt(nums, fn, comparator)
  res = merge(nums, idx, fn, comparator)  
  res[0] < res[-1] ? res : res.reverse
end

def merge(nums, idx, fn, comparator)
  res = [fn[nums[idx]]]
  left, right = idx - 1, idx + 1
  while left >= 0 && right < nums.length
    right_val, left_val = fn[nums[right]], fn[nums[left]]
    if comparator.call(left_val, right_val)
      res << left_val
      left -= 1
    else
      res << right_val
      right += 1
    end
  end

  while left >= 0
    res << fn[nums[left]]
    left -= 1
  end

  while right < nums.length
    res << fn[nums[right]]
    right += 1
  end
  res
end

def find_mid_pt(nums, fn, comparator)
  max_idx = 0
  max_val = fn[nums[0]]
  nums.each_with_index do |num, idx|
    val = fn[nums[idx]]
    if comparator[val, max_val]
      max_idx = idx
      max_val = val
    end
  end
  max_idx
end


# def find_mid_pt(nums, fn, comparator)
#   left, right = 0, nums.length - 1
#   inf = comparator[1, 2] ? 1.0/0 :  -1.0/0
#   while left < right
#     mid = (left + right) / 2
#     left_val = mid.zero? ? inf : fn.call(nums[left])
#     mid_val = fn.call(nums[mid])
#     right_val = mid == nums.length - 1 ? inf : fn.call(nums[right])
#     if comparator.call(left_val, mid_val) && comparator.call(mid_val, right_val)
#       right = mid
#     elsif comparator.call(mid_val, left_val) && comparator.call(right_val, mid_val)
#       left = mid + 1
#     else
#       left += 1
#     end
#   end
#   left
# end


p sort_transformed_array nums = [-4,-2,2,4], a = 1, b = 3, c = 5

p sort_transformed_array  nums = [-4,-2,2,4], a = -1, b = 3, c = 5

p sort_transformed_array [2,2,2,4], 0, -1, 5

#p sort_transformed_array [-95,-95,-93,-92,-89,-89,-88,-82,-81,-79,-71,-71,-66,-66,-65,-65,-62,-61,-60,-54,-54,-51,-50,-48,-47,-45,-43,-37,-35,-35,-32,-32,-29,-24,-24,-22,-20,-20,-17,-14,-13,-12,-12,-4,1,8,11,14,16,16,22,24,26,28,28,28,29,30,31,36,44,46,49,60,60,60,62,64,65,73,76,86,87,89,91,92,93,94,94,96,96,97], 41, 45, -89
# a > 0 lowest at the middle
# a < 0 highest in the middle

p sort_transformed_array [-95,-89,-87,-86,-84,-84,-84,-78,-75,-73,-71,-69,-66,-60,-59,-57,-56,-50,-49,-44,-38,-38,-29,-29,-29,-26,-24,-23,-22,-21,-21,-21,-20,-19,-18,-16,-13,-12,-12,-11,-3,-2,0,6,8,8,9,10,11,13,13,16,16,17,17,22,23,23,26,26,34,34,35,38,42,43,43,44,44,49,49,52,53,55,58,60,61,64,66,69,72,73,73,74,74,76,78,80,82,83,85,88,88,90,91], 79, -61, -65