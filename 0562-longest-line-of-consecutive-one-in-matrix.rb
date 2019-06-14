# @param {Integer[][]} m
# @return {Integer}
def longest_line(m)  
  max = 0
  return max if m.empty?
  vert = (m.length + 1).times.collect{ (m.first.length + 1).times.collect { 0 }}
  hor = (m.length + 1).times.collect{ (m.first.length + 1).times.collect { 0 }}
  diag = (m.length + 1).times.collect{ (m.first.length + 1).times.collect { 0 }}
  adiag = (m.length + 1).times.collect{ (m.first.length + 2).times.collect { 0 }}
  1.upto(m.length) do |row|
    1.upto(m.first.length) do |col|
      next if m[row - 1][col - 1].zero?
      hor_len, vert_len, diag_len, adiag_len = hor[row][col - 1], vert[row - 1][col], diag[row - 1][col - 1], adiag[row - 1][col + 1]
      cur_max = [hor_len, vert_len, diag_len, adiag_len].max + 1
      max = cur_max if max < cur_max
      hor[row][col] = hor_len + 1
      vert[row][col] = vert_len + 1
      diag[row][col] = diag_len + 1
      adiag[row][col] = adiag_len + 1
    end
  end
  max
end

p longest_line [[1,1,0,0,1,0,0,1,1,0],[1,0,0,1,0,1,1,1,1,1],[1,1,1,0,0,1,1,1,1,0],[0,1,1,1,0,1,1,1,1,1],[0,0,1,1,1,1,1,1,1,0],[1,1,1,1,1,1,0,1,1,1],[0,1,1,1,1,1,1,0,0,1],[1,1,1,1,1,0,0,1,1,1],[0,1,0,1,1,0,1,1,1,1],[1,1,1,0,1,0,1,1,1,1]]

p longest_line [[0,1,1,0],
 [0,1,1,0],
 [0,0,0,1]]