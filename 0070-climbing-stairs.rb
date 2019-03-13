# @param {Integer} n
# @return {Integer}
def climb_stairs(n)
  prev, prev_prev = 1, 1
  2.upto(n) do |n|
    current = prev + prev_prev
    prev_prev = prev
    prev = current
  end
  prev  
end

p climb_stairs 5