# @param {Integer[]} a
# @param {Integer} k
# @return {Integer[]}
def add_to_array_form(arr, k)
  carry = k
  (arr.length - 1).downto(0) do |idx|
    arr[idx] += carry
    carry = arr[idx] / 10
    arr[idx]  = arr[idx] % 10
  end
  while carry > 0
    arr.unshift(carry % 10)
    carry /= 10
  end
  arr
end

p add_to_array_form([9,9,9], 1)
p add_to_array_form([0], 1000)