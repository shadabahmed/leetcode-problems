# https://leetcode.com/problems/container-with-most-water/

# @param {Integer[]} height
# @return {Integer}
def max_area(heights)
  left, right = 0, heights.length - 1
  max_area = 0
  while left < right
    area = (right - left) * [heights[left], heights[right]].min
    max_area = area if area > max_area
    if heights[left] < heights[right]
      left += 1
    else
      right -= 1
    end
  end
  max_area
end

p max_area [1, 8, 6, 2, 5, 4, 8, 3, 7]
p max_area [4,2,4,2,6,12,5,4,2,4]
#p max_area([1, 1])
