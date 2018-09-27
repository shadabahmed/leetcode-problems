def intersect(nums1, nums2)
  dict_arr, search_arr = nums1.length > nums2.length ? [nums2, nums1] : [nums1, nums2]
  dict = dict_arr.reduce(Hash.new(0)) { |dict, num| dict[num] += 1; dict }
  search_arr.select do |num|
    dict[num] -= 1
    dict[num] >= 0
  end
end

p intersect [1, 2, 2, 1], [2, 2]

p intersect [1, 1], [1]
