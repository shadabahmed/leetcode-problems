def climb_stairs(n)
  return 1 if n == 1
  table = [1,2]
  3.upto(n) do
    n_2 = table.shift
    table.push(n_2 + table.first)
  end
  table.last
end
