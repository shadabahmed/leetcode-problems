# @param {Integer} n
# @return {Integer}
def trailing_zeroes(n)
  n < 5 ? 0 : n/5 + trailing_zeroes(n/5)
end



p trailing_zeroes(1808548329)