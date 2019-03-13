# @param {String[]} words
# @param {Integer} max_width
# @return {String[]}
def full_justify(words, max_width)
  idx = 0
  lines = []
  while idx < words.length
    new_idx = fit_in_line(words, idx, max_width)
    lines << justify(words, idx, new_idx - 1, max_width)
    idx = new_idx    
  end
  lines
end

def fit_in_line(words, idx, max_width)
  while idx < words.length && max_width >= words[idx].length
    max_width -= 1 + words[idx].length
    idx += 1
  end
  idx
end

def justify(words, start_idx, end_idx, max_width)
  words_length = start_idx.upto(end_idx).reduce(0){|len, idx| len + words[idx].length}
  gap = (max_width - words_length)
  avg_gap = gap / (end_idx - start_idx)
  line = ""
  start_idx.upto(end_idx - 1) do |idx|
    line << words[idx]
    line << ' ' * avg_gap + ' ' * gap % 
  end
  line << words[end_idx]
end

words = ["This", "is", "an", "example", "of", "text", "justification."]
max_width = 16
p full_justify(words, max_width)