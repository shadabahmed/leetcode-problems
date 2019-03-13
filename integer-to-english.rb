NUMS_HUNDRED = [[1_000_000_000, 'Billion'],
[1_000_000, 'Million'],
[1000, 'Thousand'],
[100, 'Hundred']
]

NUMS = [
  [90, 'Ninety'],
  [80, 'Eighty'],
  [70, 'Seventy'],
  [60, 'Sixty'],
  [50, 'Fifty'],
  [40, 'Forty'],
  [30, 'Thirty'],
  [20, 'Twenty'],
]

MAP = [
  [19, 'Nineteen'],
  [18, 'Eighteen'],
  [17, 'Seventeen'],
  [16, 'Sixteen'],
  [15, 'Fifteen'],
  [14, 'Fourteen'],
  [13, 'Thirteen'],
  [12, 'Twelve'],
  [11, 'Eleven'],
  [10, 'Ten'],
  [9, 'Nine'],
  [8, 'Eight'],
  [7, 'Seven'],
  [6, 'Six'],
  [5, 'Five'],
  [4, 'Four'],
  [3, 'Three'],
  [2, 'Two'],
  [1, 'One']
].to_h

def number_to_words_less_100(num)
  return '' if num.zero?
  return MAP[num] if MAP.key?(num)
  words = []
  NUMS.each do |val, english|
    if num >= val
      words << english
      num -= val
      break;
    end
  end
  words << MAP[num] if num > 0
  words.join(' ')
end

def number_to_words(num)
  return 'Zero' if num.zero?
  words = []
  NUMS_HUNDRED.each do |val, english|
    if num >= val
      count = num / val
      num = num % val
      words << number_to_words(count)
      words << english
    end
  end
  if num > 0
    words << number_to_words_less_100(num)
  end
  words.join(' ')
end
number_to_words 330_000
