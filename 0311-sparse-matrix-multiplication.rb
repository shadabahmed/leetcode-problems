# https://leetcode.com/problems/sparse-matrix-multiplication/

# @param {Integer[][]} a
# @param {Integer[][]} b
# @return {Integer[][]}
def multiply(a, b)
  mult = a.length.times.collect{ b.first.length.times.collect { 0 }}
  0.upto(a.length - 1) do |row|
    0.upto(b.first.length - 1) do |col|
      mult[row][col] = get_multiplication(a, b, row, col)
    end
  end    
  mult
end

def get_multiplication(a, b, row, col)
  0.upto(b.length - 1).reduce(0) do |sum, idx|
    sum + a[row][idx] * b[idx][col]
  end  
end

A = [
  [ 1, 0, 0],
  [-1, 0, 3]
]

B = [
  [ 7, 0, 0 ],
  [ 0, 0, 0 ],
  [ 0, 0, 1 ]
]


# @param {Integer[][]} a
# @param {Integer[][]} b
# @return {Integer[][]}
def multiply(a, b)
  mult = a.length.times.collect{ b.first.length.times.collect { 0 }}
  a_cache = {}
  0.upto(a.length - 1) do |row|
    a_cache[row] = {}
    0.upto(a[row].length - 1) do |col|
      a_cache[row][col] = a[row][col] unless a[row][col].zero?
    end
  end
  b_cache = {}
  0.upto(b.first.length - 1) do |col|
    b_cache[col] = {}
    0.upto(b.length - 1) do |row|
      b_cache[col][row] = b[row][col] unless b[row][col].zero?
    end
  end
  a_cache.each do |row, row_map|
    b_cache.each do |col, col_map|
      mult[row][col] = multiply_row_col(row_map, col_map)      
    end
  end
  mult
end

def multiply_row_col(row_map, col_map)
  return 0 if row_map.empty? || col_map.empty?
  row_map.reduce(0) do |sum, (idx, val)|
    if col_map[idx]
      sum + val * col_map[idx]
    else
      sum
    end
  end
end


p multiply A, B