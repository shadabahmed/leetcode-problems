# @param {Integer[]} a
# @param {Integer} k
# @return {Float}
def largest_sum_of_averages(a, k)
  dp = (a.length + 1).times.collect { (k +  1).times.collect { 0 }}
  0.upto(a.length) do |row|
    0.upto(k) do |col|
      next if col > row
      if col == row
        dp[row][col] = a.slice(0, row).sum
      else
        dp[row][col] = [dp[row - 1][col] + a[row - 1], dp[row][col - 1] + a[row - 1]].max
      end      
    end
  end    
  dp
end

p largest_sum_of_averages [9,1,2,3,9], 3