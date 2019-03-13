# https://leetcode.com/problems/zigzag-conversion/

# @param {String} s
# @param {Integer} num_rows
# @return {String}

def cycle_length(row, num_rows)
  if row == num_rows
    2 * (num_rows - 1)
  else
    2 * (num_rows - row)
  end
end

def convert(s, num_rows)
  1.upto(num_rows) do |row|
    steps = cycle_length(row, num_rows)
    (row - 1).step(s.length - 1, steps) do |idx|
      print s[idx]
      (steps - 1).times{print ' '}
    end
    puts
  end
end
#convert "PAYPALISHIRING", 4


def convert(s, num_rows)
  res = ''
  return s if num_rows < 2 || s.empty?
  0.upto(num_rows - 1) do |row|
    zig_zag_idx = nil
    if row > 0 && row < num_rows - 1
      zig_zag_idx = num_rows - row - 2
    end    
    row.step(s.length - 1, 2 * num_rows - 2) do |idx|
      str = s[idx]
      if zig_zag_idx
        next_str_idx = 2 * (zig_zag_idx + 1)
        str += s[idx + next_str_idx] if idx + next_str_idx < s.length
      end
      res << str
    end
  end
  res
end

p  convert "PAYPALISHIRING", 1