def trap(heights)
  rm, lm, rainwater = heights.clone, heights.clone, 0
  (heights.length - 2).downto(0) do |idx|
    rm[idx] = heights[idx] > rm[idx + 1] ? heights[idx] : rm[idx + 1]
  end

  1.upto(heights.length - 1) do |idx|
    lm[idx] = heights[idx] > lm[idx - 1] ? heights[idx] : lm[idx - 1]
    rainwater += [lm[idx], rm[idx]].min - heights[idx]
  end

  rainwater
end


p trap([0,1,0,2,1,0,1,3,2,1,2,1])
