# @param {String} s
# @return {Integer[]}
def partition_labels(s)
  partitions, pos_map = [], {}
  max_idx, prev_idx = -1, -1
  0.upto(s.length - 1) do |idx|
    pos_map[s[idx]] = idx
  end

  0.upto(s.length - 1) do |idx|
    current_max_idx = pos_map[s[idx]]
    max_idx = current_max_idx if current_max_idx > max_idx
    if max_idx == idx
      partitions << max_idx - prev_idx
      prev_idx = max_idx
      max_idx = -1
    else
      max_idx = pos_map[s[idx]] if pos_map[s[idx]] > max_idx
    end
  end
  partitions
end

p partition_labels  "ababcbacadefegdehijhklij"
p partition_labels  "abcdefghijklmnopqwxyza"