# @param {String} s
# @return {Integer}
def num_decodings(s)
  return 0 if s.empty?
  prev_last_decoding = 1
  last_decoding = s[-1] == '0' ? 0 : 1
  (s.length - 2).downto(0) do |idx|
    char = s[idx]
    d_idx = 0
    current_val = s[idx].ord - 48
    d_idx += last_decoding if (1..9).include?(current_val)
    current_next_val = current_val*10 + (s[idx + 1].ord - 48)
    d_idx += prev_last_decoding if (10..26).include?(current_next_val)
    prev_last_decoding = last_decoding
    last_decoding = d_idx
  end
  last_decoding
end


num_decodings '226'


def get_multiplier(chr, idx)
  if chr[idx] == '*'
    9
  elsif chr[idx] == '0'
    0
  else
    1
  end
end

def get_double_multiplier(chr, idx)
  first, second = chr[idx], chr[idx + 1]
  if first == '0'
    0
  elsif second == '*'
    if first == '*'
      15
    elsif first == '1'
      9
    elsif first == '2'
      6
    else
      0
    end
  elsif first == '*'
    (0..6).include?(second.ord - 48) ? 2 : 1
  else
    (10..26).include?((first.ord - 48) * 10 + second.ord - 48) ? 1 : 0
  end
end

def num_decodings_2(s)
  return 0 if s.empty?
  prev_last_decoding = 1
  last_decoding = get_multiplier(s, s.length - 1)
  (s.length - 2).downto(0) do |idx|
    char = s[idx]
    single_multiplier = get_multiplier(s, idx)
    double_multiplier = get_double_multiplier(s, idx)
    d_idx = single_multiplier * last_decoding + double_multiplier * prev_last_decoding
    prev_last_decoding = last_decoding
    last_decoding = d_idx
  end
  last_decoding
end
