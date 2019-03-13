# https://leetcode.com/explore/interview/card/top-interview-questions-hard/116/array-and-strings/827/


def product_except_self(nums)
  prods = []
  prev = 1
  0.upto(nums.length - 1) do |idx|
    prods[idx] = prev * nums[idx]
    prev *= nums[idx]
  end
  right_prod = 1
  (nums.length - 1).downto(1) do |idx|
    prods[idx] = prods[idx - 1] * right_prod
    right_prod *= nums[idx]
  end
  prods[0] = right_prod
  prods
end

p product_except_self [2,3,5,0]
