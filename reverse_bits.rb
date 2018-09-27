def reverse_bits(n)
  digits = ['0'] * 32
  0.upto(31) do |idx|
    digits[idx] = (n & 1) != 0 ? '1' : '0'
    n >>= 1
    break if n == 0
  end
  digits.join.to_i(2)
end

reverse_bits 2
reverse_bits 43261596
