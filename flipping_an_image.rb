# @param {Integer[][]} a
# @return {Integer[][]}
def flip_and_invert_image(a)
  a.each do |row|
    left, right = 0, row.length - 1
    while left <= right
      row[left], row[right] = row[right] ^ 1, row[left] ^ 1
      left += 1
      right -= 1
    end
  end
  a  
end
p flip_and_invert_image [[1,1,0],[1,0,1],[0,0,0]]
p flip_and_invert_image [[1,1,0,0],[1,0,0,1],[0,1,1,1],[1,0,1,0]]