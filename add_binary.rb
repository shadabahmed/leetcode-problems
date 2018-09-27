def add(c1, c2, carry = '0')
  if c1 == c2
    [c1, carry]
  elsif carry == '0'
    ['0', '1']
  else
    ['1', '0']
  end
end

def add_binary(a, b)
  res = []
  carry = '0'
  l_idx, r_idx = a.length - 1, b.length - 1
  while l_idx >= 0 && r_idx >= 0
    carry, digit = add(a[l_idx], b[r_idx], carry)
    res.unshift(digit)
    l_idx -= 1
    r_idx -= 1
  end

  while l_idx >= 0
    carry, digit = add(a[l_idx], carry)
    res.unshift(digit)
    l_idx -= 1
  end

  while r_idx >= 0
    carry, digit = add(b[r_idx], carry)
    res.unshift(digit)
    r_idx -= 1
  end

  res.unshift('1') if carry == '1'
  res.join
end
