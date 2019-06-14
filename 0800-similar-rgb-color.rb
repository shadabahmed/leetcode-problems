# @param {String} color
# @return {String}
def similar_rgb(color)
  "##{next_shorthand_color(color[1..2])}#{next_shorthand_color(color[3..4])}#{next_shorthand_color(color[5..6])}"
end

def next_shorthand_color(i)  
  num = i.to_i(16)
  return i if is_shorthand?(num)
  lower, higher = num - 1, num + 1
  lower = (lower - 1) % 256 while !is_shorthand?(lower)
  higher = (higher + 1) % 256 while !is_shorthand?(higher)
  if (num - higher).abs < (num - lower).abs
    higher.to_s(16).rjust(2, '0')
  else
    lower.to_s(16).rjust(2, '0')
  end
end

def is_shorthand?(i)
  i % 16 == i / 16
end

p similar_rgb "#1c9e03"