# @param {String} version1
# @param {String} version2
# @return {Integer}
def compare_version(version1, version2)
  idx = 0
  version1 = version1.split(".").collect(&:to_i)
  version2 = version2.split(".").collect(&:to_i)
  while idx < version1.length || idx < version2.length
    first = idx < version1.length ? version1[idx] : 0
    second = idx < version2.length ? version2[idx] : 0
    if first > second
      return 1
    elsif first < second
      return -1
    end
    idx += 1
  end
  0
end

p compare_version "7.5.2.4", "7.5.3"
p compare_version "1.0.1", "1"
p compare_version "1.0.0.0", "1"
