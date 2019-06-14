# @param {String[]} words
# @param {Integer} max_width
# @return {String[]}
def full_justify(words, max_width)
  idx = 0
  lines = []
  while idx < words.length
    new_idx = fit_in_line(words, idx, max_width)
    if new_idx == words.length
      lines << left_justify(words, idx, new_idx - 1, max_width)
    else
      lines << justify(words, idx, new_idx - 1, max_width)
    end    
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
  return words[end_idx] + ' ' * (max_width - words[end_idx].length)if start_idx == end_idx 
  words_length = start_idx.upto(end_idx).reduce(0){|len, idx| len + words[idx].length}
  gap = (max_width - words_length)
  slots = end_idx - start_idx
  avg_gap = gap / slots
  remainder_gap = gap % slots
  line = ''
  start_idx.upto(end_idx - 1) do |idx|
    line << words[idx]
    line << ' ' * avg_gap
    if remainder_gap > 0
      line << ' '
      remainder_gap -= 1
    end
  end
  line << words[end_idx]
end

def left_justify(words,start_idx, end_idx, max_width)
  line = ''
  start_idx.upto(end_idx) do |idx|
    line << words[idx]
    line << ' ' if idx < end_idx
  end
  line << ' ' * (max_width - line.length)
end

words = ["This", "is", "an", "example", "of", "text", "justification."]
max_width = 16
words = ["What","must","be","acknowledgment","shall","be"]

p full_justify(words, max_width)