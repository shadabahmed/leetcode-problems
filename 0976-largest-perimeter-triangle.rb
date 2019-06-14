# @param {Integer[]} a
# @return {Integer}
def largest_perimeter(a)
  a.sort!
  (a.length - 3).downto(0) do |idx|
    return a[idx] + a[idx + 1] + a[idx + 2] if a[idx] + a[idx + 1] > a[idx + 2]
  end
  0
end

p largest_perimeter [3,2,3,4]
