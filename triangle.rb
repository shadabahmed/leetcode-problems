def minimum_total(triangle)
  dp = (triangle.size + 1).times.collect { 0 }
  (triangle.size - 1).downto(0) do |idx|
    row = triangle[idx]
    next_num = dp[idx + 1]
    idx.downto(0) do |idx|
      next_num, dp[idx] = dp[idx], row[idx] + [dp[idx], next_num].min
    end
  end
  dp[0]
end
