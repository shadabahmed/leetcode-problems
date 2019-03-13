# @param {Integer} n
# @param {Integer} k
# @return {Integer[][]}
def combine(n, k)
  return [] if k.zero?    
  combinations(1, n, k)
end

def combinations(n, k, current = 1, stack = [], res = [])
  return res.push(stack.clone) if stack.length == k
  return res if current > n  
  stack.push(current)
  combinations(n, k, current + 1, stack, res)
  stack.pop  
  combinations(n, k, current + 1, stack, res)  
  res
end

def combinations(n, k, current = 1, stack = [], res = [])
  prev = [[]]
  1.upto(k) do |len|
    current_comb = []
    len.upto(n) do |num|
      prev.each do |last_comb|
        next if !last_comb.empty? && last_comb.last >= num
        current_comb << last_comb + [num]
      end
    end
    prev = current_comb
  end
  prev
end


# basic idea 
# 1 2 3 4 5 6 
# put 1 in and find all combs
# remove 1 and then find all combs

p combinations(4, 2)

