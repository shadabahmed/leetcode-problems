# @param {Integer} n
# @return {Integer}

def count_primes(n)
  return 0 if n <= 2
  cache = [1]*(n)
  cache[0] = cache[1] = 0
  2.upto(Math.sqrt(n - 1)) do |num|
    if cache[num] != 0
      (2 * num).step((n - 1), num) do |multiplier|
        cache[multiplier] = 0
      end
    end
  end
  cache.sum
end

count_primes 3
