# @param {Integer[][]} edges
# @return {Integer[]}
def find_redundant_connection(edges)
  res = []
  islands = []
  edges.each do |n1, n2|
    i1 = find_island(islands, n1)
    res.push([n1, n2]) if islands[i1].include?(n2)
    i2 = find_island(islands, n2)
    merge_islands(islands, i1, i2)
  end
  res.last
end
islands = []
def find_island(islands, n1)
  idx = islands.find_index{|s| s.include?(n1)}
  if idx.nil?
    islands << Set.new([n1])
    islands.size - 1
  else
    idx 
  end
end

def merge_islands(islands, i1, i2)
  islands[i1] += islands[i2]
  islands[i2], islands[-1] = islands[-1], islands[i2]
  islands.pop
end

p find_redundant_connection [[1,2], [1,3], [2,3]]
p find_redundant_connection [[1,2], [2,3], [3,4], [1,4], [1,5]]

p find_redundant_connection [[9,10],[5,8],[2,6],[1,5],[3,8],[4,9],[8,10],[4,10],[6,8],[7,9]]
