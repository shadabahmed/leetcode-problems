# @param {String} input
# @return {Integer}
def length_longest_path(input)
  lengths_map = Hash.new(0)
  max_length = 0
  input.split("\n").each do |line|
    trimmed_line = line.gsub("\t", '')
    level = line.length - trimmed_line.length + 1
    lengths_map[level] = trimmed_line.length + lengths_map[level - 1] + (level == 1 ? 0: 1)
    if trimmed_line.include?('.')
      max_length = lengths_map[level] if lengths_map[level] > max_length
    end
  end
  max_length
end

p length_longest_path "dir\n\tsubdir1\n\tsubdir2\n\t\tfile.ext"
p length_longest_path "dir\n\tsubdir1\n\t\tfile1.ext\n\t\tsubsubdir1\n\tsubdir2\n\t\tsubsubdir2\n\t\t\tfile2.ext"
p length_longest_path "dir\n        file.txt"