require 'pry'

NEG_INFINITY = -1.0/0

def max_product(nums)
  last_neg_idx = -1
  current_prod = 1
  last_neg_prod = 1
  (nums.length - 1).downto(0) do |idx|
    if nums[idx] < 0
      last_neg_idx = idx
      break
    end
  end

  max_prod = NEG_INFINITY
  0.upto(nums.length - 1) do |idx|
    num = nums[idx]
    current_prod *= num
    max_prod = current_prod if current_prod > max_prod
    if num == 0
      current_prod = 1
      last_neg_prod = 1
    elsif last_neg_prod == 1 && current_prod < 0
      last_neg_prod = current_prod
    elsif current_prod < 0 && last_neg_prod < 0 && (idx == last_neg_idx || idx == nums.length - 1)
      current_prod /= last_neg_prod
      max_prod = current_prod if current_prod > max_prod
    end
  end
  max_prod
end


def max_subproduct(nums, first, last)
  return 0 if first > last
  return nums[first] if first == last
  max_prod = NEG_INFINITY
  current_prod, last_neg_prod = 1, 1
  first.upto(last) do |idx|
    num = nums[idx]
    current_prod *= num
    max_prod = current_prod if current_prod > max_prod
    last_neg_prod = current_prod if last_neg_prod == 1 && current_prod < 0
  end
  [current_prod / last_neg_prod, max_prod].max
end

def max_product(nums)
  first = 0
  last = 0
  max = NEG_INFINITY
  0.upto(nums.length) do |idx|
    if nums[idx] == 0 || idx == nums.length
      prod = max_subproduct(nums, first, idx - 1)
      max = prod if prod > max
      max = 0 if nums[idx] == 0 && max < 0
      first = idx + 1
    end
  end
  max
end
p max_product([1,2,3, -1, -10])
p max_product([1,2,3, -1, 0, -10, -2, 6])
p max_product([3, -1, 4])
p max_product([-2, 0, -1])
p max_product [-1,-2,-3,0]
p max_product [-2,3,-4]
p max_product [1,-2,3,-4,-3,-4,-3]
p max_product [-2,1,0]
