# https://leetcode.com/problems/trapping-rain-water/

# @param {Integer[]} height
# @return {Integer}
def trap(heights)
  left_heights = [0] * heights.length 
  right_heights = [0] * heights.length 
  water = 0
  1.upto(heights.length) do |idx|
    left_heights[idx] = heights[idx - 1] > left_heights[idx - 1] ? heights[idx - 1] : left_heights[idx - 1]   
  end

  (heights.length - 2).downto(0) do |idx|
    right_heights[idx] = heights[idx + 1] > right_heights[idx + 1] ? heights[idx + 1] : right_heights[idx + 1]
  end

  heights.each_with_index do |height, idx|
    lowest_wall_height = [left_heights[idx], right_heights[idx]].min
    if lowest_wall_height > height
      water += lowest_wall_height - height
    end    
  end

  water
end

p trap [0,1,0,2,1,0,1,3,2,1,2,1]