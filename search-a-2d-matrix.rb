# @param {Integer[][]} matrix
# @param {Integer} target
# @return {Boolean}
def search_matrix(matrix, target)
  return false if matrix.empty?
  row = bin_search(0, matrix.length - 1) do |row|
          return false if matrix[row].empty?
          if matrix[row].last < target
            1
          elsif matrix[row].first > target
            -1
          else
            0
          end
        end
  return false if row < 0
  col = bin_search(0, matrix[row].length) do |col|
          target <=> matrix[row][col]
        end
  col >= 0
end

def bin_search(first, last, &block)
  while first <= last
    mid = (first + last) / 2
    res = block.call(mid)
    return mid if res.zero?
    if res > 0
      first = mid + 1       
    else
      last = mid - 1
    end
  end
  -1
end

matrix = [
  [1,   3,  5,  7],
  [10, 11, 16, 20],
  [23, 30, 34, 50]
]
target = 1
p search_matrix matrix, target

p search_matrix [[]], 1