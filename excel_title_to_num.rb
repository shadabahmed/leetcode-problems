def title_to_number(s)
  num = 0
  s.each_char do |char|
    num = num * 26 + char.ord - 64
  end
  num
end
