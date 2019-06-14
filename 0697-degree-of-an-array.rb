# @param {Integer[]} nums
# @return {Integer}
def find_shortest_sub_array(nums)
  freq_map, left_map, right_map = Hash.new(0), {}, {}
  max_freq = 0
  nums.each_with_index do |num, idx|
    freq_map[num] += 1
    left_map[num] = idx unless left_map.key?(num)
    right_map[num] = idx
    max_freq = freq_map[num] if max_freq < freq_map[num]
  end 
  min_len = nums.length
  freq_map.each do |num, count|
    next if count != max_freq
    len = right_map[num] - left_map[num] + 1
    min_len = len if len < min_len
  end
  min_len
end

p find_shortest_sub_array [1,2,2,3,1]
p find_shortest_sub_array [2,1,1,2,1,3,3,3,1,3,1,3,2]
