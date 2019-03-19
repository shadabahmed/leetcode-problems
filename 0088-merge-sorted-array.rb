# @param {Integer[]} nums1
# @param {Integer} m
# @param {Integer[]} nums2
# @param {Integer} n
# @return {Void} Do not return anything, modify nums1 in-place instead.
def merge(nums1, m, nums2, n)
  j, k = m - 1, n - 1
  while j >= 0 && k >= 0
    if nums1[j] > nums2[k]
      nums1[j + k + 1] = nums1[j]
      j -= 1
    else
      nums1[j + k + 1] = nums2[k]
      k -= 1
    end
  end
  while k >= 0
    nums1[j + k + 1] = nums2[k]
    k -= 1
  end
end

p merge nums1 = [2,2,3,0,0,0], m = 3, nums2 = [1,5,6],       n = 3

p merge [4,5,6,0,0,0], 3, [1,2,3], 3

p merge [4,0,0,0,0,0], 1, [1,2,3,5,6], 5