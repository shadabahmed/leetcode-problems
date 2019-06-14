  # @param {Integer} n
  # @return {Integer}
  def binary_gap(n)
    prev = -1
    pos = 0
    max_len = 0
    while n > 0
      is_digit_one = n & 1 == 1
      if is_digit_one && prev >= 0
        len = pos - prev
        max_len = len if max_len < len
        prev = pos
      elsif is_digit_one
        prev = pos
      end
      pos += 1
      n /= 2
    end
    max_len
  end

# @param {Integer} n
# @return {Integer}
def binary_gap(n)
  prev = -1
  pos = 0
  max_len = 0
  while n > 0    
    if n & 1 > 0
      if prev >= 0
        len = pos - prev
        max_len = len if max_len < len
      end
      prev = pos
    end
    pos += 1
    n /= 2
  end
  max_len
end
p binary_gap 6