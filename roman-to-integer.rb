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
