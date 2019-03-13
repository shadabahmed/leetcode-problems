# @param {String} s
# @return {String[]}
def restore_ip_addresses(s, idx = 0, res = [], stack = [])
  if !stack.empty? && (stack.last.to_i > 255 || (stack.last.length > 1 && stack.last[0] == '0'))
    return res
  elsif stack.length == 4 && idx >= s.length
    return res.push(stack.join('.'))
  elsif stack.length == 4
    return res
  end
  idx.upto(idx + 2) do |n_idx|
    break if n_idx >= s.length
    stack.push(s[idx..n_idx])
    restore_ip_addresses(s, n_idx + 1, res, stack)
    stack.pop
  end
  res
end