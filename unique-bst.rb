## matrix n * n

def num_trees_helper(n)
  dp = (n + 1).times.collect { 0 }
  dp[0] = 1
  1.upto(n) do |max|
    1.upto(max) do |root_val|
      dp[max] += dp[root_val - 1] * dp[max - root_val]
    end
  end
  dp[n]
end
num_trees_helper 3

def num_trees_helper(n, first, cache = {})
  return 1 if n < first
  return cache[n][first] if cache.key?(n) && cache[n].key?(first)
  sum = 0
  cache[n] ||= {}
  first.upto(n) do |root_val|
    sum += num_trees_helper(root_val - 1, first, cache) * num_trees_helper(n, root_val + 1, cache)
  end
  cache[n][first] = sum
end


def num_trees(n)
  return 0 if n == 0
  num_trees_helper(n, 1)
end
