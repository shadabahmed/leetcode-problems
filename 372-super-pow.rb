# https://leetcode.com/problems/random-pick-with-blacklist/submissions/

# @param {Integer} a
# @param {Integer[]} b
# @return {Integer}
def super_pow(a, b)    
  super_pow_helper(a, b.join.to_i) % 1337
end

def super_pow_helper(a, b)
  return 1 if b.zero?
  return a if b == 1
  x = super_pow_helper(a, b / 2)
  res = if b % 2 == 0
          x * x
        else
          x * x * a
        end
  res > 1337 ? res % 1337 : res
end

p super_pow 2147483647, [2,0,0]