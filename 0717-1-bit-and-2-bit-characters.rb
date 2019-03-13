# @param {Integer[]} bits
# @return {Boolean}
def is_one_bit_character(bits, idx = 0)
  idx = 0
  while idx < bits.length - 1
    idx += bits[idx] + 1    
  end
  idx == bits.length - 1
end

p is_one_bit_character [1, 0, 0]
p is_one_bit_character [1, 1, 1, 0]