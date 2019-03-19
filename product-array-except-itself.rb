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




























# @param {Integer[]} nums
# @return {Integer[]}
def product_except_self(nums)
   products = [1] * (nums.length + 1)
   res = []
   0.upto(nums.length - 1) do |idx|
      products[idx + 1] = products[idx] * nums[idx]
   end
   prod = 1
   (nums.length - 1).downto(0) do |idx|
    res[idx] = prod * products[idx]
    prod *= nums[idx]
   end
   res
end
p product_except_self [1,2,3,4]