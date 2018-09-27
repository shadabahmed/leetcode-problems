INFINITY = 1.0 / 0

def num_squares(n)
  dp = [0, 1]
  2.upto(n) do |num|
    dp[num] = INFINITY
    (Math.sqrt(num).ceil).downto(1) do |k|
      next if k*k > num
      with_k = dp[num - k * k] + 1
      dp[num] = with_k if with_k < dp[num]
    end
  end
  dp[n]
end
