# @param {Integer[]} nums1
# @param {Integer[]} nums2
# @return {Integer[]}
require "set"

def intersection(nums1, nums2)
  dict_arr, search_arr = nums1.length > nums2.length ? [nums2, nums1] : [nums1, nums2]
  dict = dict_arr.reduce({}) { |d, n| d[n] = true; d }
  search_arr.select do |num|
    dict.delete(num)
  end
end

p intersection [1, 2, 2, 1], [2, 2]
