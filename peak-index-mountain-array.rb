# @param {Integer[]} a
# @return {Integer}
def peak_index_in_mountain_array(a)
  0.upto(a.length - 2).find {|idx| a[idx] > a[idx + 1]}    
end


# @param {Integer[]} a
# @return {Integer}
def peak_index_in_mountain_array(a)
  left, right = 0, a.length - 1
  while (left + 1)  < right
    mid = (left + right) / 2
    return mid if a[mid] > a[mid - 1] && a[mid] > a[mid + 1]
    if a[mid] < a[mid + 1]
      left = mid
    else
      right = mid
    end
  end
end

p peak_index_in_mountain_array [0,2,1,0]