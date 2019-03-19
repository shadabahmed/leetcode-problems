# @param {String} s
# @return {Integer}
MAP = {'I' => 1,
  'V' => 5,
  'X' => 10,
  'L' => 50,
  'C' => 100,
  'D' => 500,
  'M' => 1000}
  
  
def roman_to_int(s)
  num = 0
  prev = 0
  s.each_char do |char|
    current = MAP[char]
    num += current
    if current > prev
      num -= 2 * prev
    end
    prev = current
  end
  num
end


LEVELS = {'I' => 1, 'IV' => 4, 'V' => 5, 'IX' => 9,'X' => 10, 'XL' => 40, 'L' => 50, 'XC' => 90, 
          'C' => 100, 'CD' => 400, 'D' => 500, 'CM' => 900, 'M' => 1000}

# @param {String} s
# @return {Integer}
def roman_to_int(s)
  int, idx = 0, 0
  while idx < s.length
    if idx < s.length - 1 && LEVELS[s[idx..(idx + 1)]]
      int += LEVELS[s[idx..(idx + 1)]]
      idx += 2
    else
      int += LEVELS[s[idx]]
      idx += 1
    end
  end
  int
end

p roman_to_int "MCMXCIV"