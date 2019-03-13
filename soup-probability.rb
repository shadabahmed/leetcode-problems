# @param {Integer} n
# @return {Float}

# def soup_servings(n)
#   dp = (n / 25 + 1).times.collect { (n / 25 + 1).times.collect { 0 } }  
#   dp[n][n] = 1
#   dp.each {|r| p r}
#   prob = 0.5 * dp[0][0]
#   1.upto(n) {|b| prob += dp[0][b]}
#   prob
# end

# p soup_servings(50)



def soup_servings(n)
  cache_a = {}
  cache_both = {}
  a_empty_prob(n,n, cache_a) + 0.5 * both_empty_prob(n,n, cache_both)
end

def a_empty_prob(a, b, cache)
  return cache[a][b] if cache.key?(a) && cache[a].key?(b)
  return 1 if a <= 0 && b > 0
  return 0 if a <= 0 || b <= 0
  cache[a] ||= {}
  cache[a][b] = 
    0.25 * a_empty_prob(a - 100, b, cache) +
    0.25 * a_empty_prob(a - 75, b - 25, cache) +
    0.25 * a_empty_prob(a - 50, b - 50, cache) +
    0.25 * a_empty_prob(a - 25, b - 75, cache)  
end

def both_empty_prob(a, b, cache)
  return cache[a][b] if cache.key?(a) && cache[a].key?(b)
  return 1 if a <= 0 && b <= 0
  return 0 if a <= 0 || b <= 0
  cache[a] ||= {}
  cache[a][b] = 
  0.25 * both_empty_prob(a - 100, b, cache) +
  0.25 * both_empty_prob(a - 75, b - 25, cache) +
  0.25 * both_empty_prob(a - 50, b - 50, cache) +
  0.25 * both_empty_prob(a - 25, b - 75, cache)
end

p soup_servings(800)
