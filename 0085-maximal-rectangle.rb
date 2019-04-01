# @param {Character[][]} matrix
# @return {Integer}
def maximal_rectangle(matrix)
  dp = (matrix.length + 1).times.collect{ (matrix.first.length + 1).times.collect{ [0,0] }}
  1.upto(matrix.length) do |row|
    1.upto(matrix.first.length) do |col|
      next if matrix[row - 1][col - 1] == '0'
      width, height = if dp[row -1][col] == [0,0]
        [dp[row][col - 1][0] + 1,1]
      elsif dp[row][col - 1] == [0,0]
        [1, dp[row - 1][col][1] + 1]
      else
        [[dp[row][col - 1][0],dp[row - 1][col][0]].min + 1,
        [dp[row][col - 1][1],dp[row - 1][col][1]].min + 1]
      end
      dp[row][col] = [width,height]
    end
  end
  dp.each{|r| p r}
  dp[matrix.length][matrix.first.length]
end

p maximal_rectangle [
  ["1","0","1","0","0"],
  ["1","0","1","1","1"],
  ["1","1","1","1","1"],
  ["1","0","0","1","0"]
]