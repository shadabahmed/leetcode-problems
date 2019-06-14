# @param {Integer[][]} a
# @return {Integer[][]}
def transpose(a)
  0.upto(a.length - 1) do |x|
    row, col = a.length - 1, a[x].length - 1
    while row > x && col > x
      if row > col
        row -= 1
      elsif col > row
        col -= 1
      else
        a[row][x], a[x][col] = a[x][col], a[row][x]
        row -= 1
        col -= 1
      end      
    end
  end
  a
end



# @param {Integer[][]} a
# @return {Integer[][]}
def transpose(a)
  res = []
  0.upto(a[0].length - 1) do |col|
    res << []
    0.upto(a.length - 1) do |row|
      res[-1] << a[row][col]
    end
  end
  res
end
p transpose  [[1,2,3],[4,5,6],[7,8,9]]

p transpose [[1,2,3],[4,5,6]]