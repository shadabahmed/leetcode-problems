# @param {Integer} num
# @return {Integer[]}
def count_bits(num)
  max_bits = get_max_bits(num)
  res = []
  0.upto(max_bits) do |bits|
    get_nums_with_bit_count(max_bits, bits).each do |i|
      p i
      res[i] = bits if i <= num
    end
  end
  res
end

def get_max_bits(num)
  bits = 0
  bits += 1 while 2 ** bits < num
  bits + 1
end

def get_nums_with_bit_count(size, count, num = '0' * size, res = [], idx = 0)
  return res if count > size
  return res.push(num.to_i(2)) if size.zero? && count.zero?
  get_nums_with_bit_count(size - 1, count, num, res, idx + 1)
  if count > 0
    num[idx] = '1'
    get_nums_with_bit_count(size - 1, count - 1, num, res, idx + 1)
    num[idx] = '0'
  end
  res
end


# @param {Integer} num
# @return {Integer[]}
def count_bits(num)  
  res = [0]
  1.upto(num) do |num|
    res[num] = res[num & (num - 1)] + 1
  end
  res
end

p count_bits(16)


