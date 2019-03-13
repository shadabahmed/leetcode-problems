# @param {Integer[]} data
# @return {Boolean}
def valid_utf8(data)
  idx = 0
  while idx < data.size
    idx = get_next_valid_idx(data, idx)
    return false if idx < 0
  end
  true
end

def get_next_valid_idx(data, idx)
  n = get_char_size(data[idx])
  return -1 if n < 0 || n > 4 || data.length - idx < n
  (idx + 1).upto(idx + n - 1) do |char_idx|
    return -1 unless valid?(data[char_idx])
  end
  idx + n
end

def valid?(byte)
  byte & (3 << 6) == 1 << 7
end

def get_char_size(byte)
  size = 1
  n = 1 << 7
  while byte & n != 0
    n >>= 1
    size += 1
  end
  return -1 if size == 2
  size == 1 ? 1 : size - 1
end

p get_char_size(0b11011111)

p valid_utf8([235, 140, 4])