def next_key(current, selected)
  if current == 5
    1.upto(9) do |next_num|
      next if next_num == 5 || selected.include?(next_num)
      yield next_num
    end
  elsif [2,4,6,8].include?(current)
    1.upto(9) do |next_num|
      next if selected.include?(next_num)
      if !selected.include(5)
        next if current == 2 && next_num == 8 || current == 8 && next_num == 2
        next if current == 4 && next_num == 6 || current == 6 && next_num == 4
      end
      yield next_num
    end
  else
    1.upto(9) do |next_num|
      next if selected.include?(next_num)
      if !selected.include(5)
        next if current == 2 && next_num == 8 || current == 8 && next_num == 2
        next if current == 4 && next_num == 6 || current == 6 && next_num == 4
      end
      yield next_num
    end
  end

end
