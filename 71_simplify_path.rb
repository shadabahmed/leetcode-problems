# @param {String} path
# @return {String}
def simplify_path(path)
  res = []
  path.split('/').each do |segment|
    next if segment.length.zero? || segment == '.'
    if segment == '..'
      res.pop unless res.empty?
    else
      res.push(segment)
    end
  end
  "/" + res.join('/')
end

path = "/home/"
p simplify_path path
path = "/a/./b/../../c/"
p simplify_path path
path = "/a/../../b/../c//.//"
p simplify_path path
path = "/a//b////c/d//././/.."
p simplify_path path

p simplify_path ".."