SYMBOLS = %w[I V X L C D M]

def convert(num, res, one, five, ten)
  while num != 0
    if (1..3).include?(num) || (6..8).include?(num)
      num -= 1
      res.unshift(one)
    elsif num == -1
      num += 1
      res.unshift(one)
    elsif num == 4 || num == 5
      num -= 5
      res.unshift(five)
    else num == 9 || num == 10
      num -= 10
      res.unshift(ten)
    end
  end
  res
end

def int_to_roman(num)
  res = []
  idx = 0
  while num > 0
    convert(num % 10,res, *SYMBOLS[idx..(idx + 2)])
    num /= 10
    if idx < 4
      idx += 2
    else
      while num > 0
        num -= 1
        res.unshift('M')
      end
    end
  end
  res.join
end

int_to_roman 1994
