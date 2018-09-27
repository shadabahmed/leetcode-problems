def is_interleave(s1, s2, s3)
  return false if s3.length != s1.length + s2.length
  matrix = (s1.length + 1).times.collect{(s2.length + 1).times.collect{ false }}
  matrix[0][0] = true
  0.upto(s1.length) do |s1_len|
    0.upto(s2.length) do |s2_len|
      next if s1_len.zero? && s2_len.zero?
      s3_len = s1_len + s2_len
      matrix[s1_len][s2_len] = (matrix[s1_len][s2_len - 1] && s3[s3_len - 1] == s2[s2_len - 1]) ||
                               (matrix[s1_len - 1][s2_len] && s3[s3_len - 1] == s1[s1_len - 1])
    end
  end
  matrix[s1.length][s2.length]
end
