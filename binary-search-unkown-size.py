class Solution:
    def search(self, reader, target):
        """
        :type reader: ArrayReader
        :type target: int
        :rtype: int
        """
        first, last = 0, 19999
        while first <= last:
          mid = (first + last) / 2
          mid_num = reader.get(mid)
          if mid_num > target:
            last = mid - 1
          elif target > mid_num:
            first = mid + 1
          else:
            return mid
        return -1 

class Reader:
  def __init__(self, arr):
    self.arr = arr

  def get(self, idx):
    if idx >= len(self.arr):
      return 10000
    return self.arr[idx]


print Solution().search(Reader([1,2,3,4,5,6,7]), 7)