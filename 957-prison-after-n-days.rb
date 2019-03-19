# @param {Integer[]} cells
# @param {Integer} n
# @return {Integer[]}
def prison_after_n_days(cells, n)
  return cells if n.zero?
  n -= 1
  transition_map = {0 => transition(cells)}
  cycle_length = 1
  1.upto(n) do |k|
    updated_cells = transition(transition_map[k - 1])    
    break if updated_cells == transition_map[0]
    cycle_length += 1
    transition_map[k] = updated_cells    
  end
  transition_map[n % cycle_length]
end

def transition(cells)
  res = cells.clone
  res[0] = 0
  res[cells.length - 1] = 0
  1.upto(cells.length - 2) do |idx|
    if cells[idx - 1] == cells[idx + 1]
      res[idx] = 1
    else
      res[idx] = 0
    end
  end
  res
end

p prison_after_n_days [1, 1, 0, 1, 1, 0, 0, 0], 1
p prison_after_n_days cells = [0,1,0,1,1,0,0,1], n = 7
p prison_after_n_days cells = [1,0,0,1,0,0,1,0], n = 1000000000