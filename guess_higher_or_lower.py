# The guess API is already defined for you.
# @param num, your guess
# @return -1 if my number is lower, 1 if my number is higher, otherwise return 0
# def guess(num):

class Solution(object):
    def guessNumber(self, n):
        """
        :type n: int
        :rtype: int
        """
        first, last = 1, n
        while first <= last:
          mid = (first + last) / 2
          res = guess(mid)
          if res > 0:
            first = mid + 1
          elif res < 0:
            last = mid - 1
          else:
            return mid    
        return -1 
