# @param {Integer} a
# @param {Integer} b
# @param {Integer} c
# @param {Integer} d
# @param {Integer} e
# @param {Integer} f
# @param {Integer} g
# @param {Integer} h
# @return {Integer}
def compute_area(a, b, c, d, e, f, g, h)
  area(a,b,c,d) + area(e,f,g,h) - intersection_area(a, b, c, d, e, f, g, h)
end

def area(a,b,c,d)
  (c - a) * (d - b)
end

def intersection_area(a, b, c, d, e, f, g, h)
  if a > g || c < e || d < f || b > h
    0
  else
    find_intersection_length(a,c,e,g) * find_intersection_length(b,d,f,h)
  end    
end

def find_intersection_length(a,b,c,d)
  if c >= a && c <= b
    [b, d].min - c
  elsif d >= a && d <= b
    d - [a,c].max
  else
    b - a
  end
end

p compute_area -3, 0, 3, 4, 0, -1, 9, 2