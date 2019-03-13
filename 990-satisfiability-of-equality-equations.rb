# @param {String[]} equations
# @return {Boolean}
def equations_possible(equations)
  graph = create_graph(equations)  
  color_map = color_graph(graph)
  equations.each do |equation|
    l1, sign, l2 = equation[0], equation[1], equation[3] 
    next unless sign == '!'
    return false if l1 == l2 || (color_map[l1] != 0 && color_map[l1] == color_map[l2])
  end
  true
end

def create_graph(equations)
  graph = {}
  equations.each do |equation|        
    l1, sign, l2 = equation[0], equation[1], equation[3] 
    next if sign == '!'
    graph[l1] ||= Set.new
    graph[l2] ||= Set.new
    graph[l1].add(l2)
    graph[l2].add(l1)
  end
  graph
end

def color_graph(graph)
  color_map = Hash.new(0)
  color = 0
  graph.keys.each do |letter|
    next if color_map[letter] != 0
    color += 1
    stack = [letter]
    color_map[letter] = color
    while !stack.empty?
      current = stack.pop
      graph[current].each do |neighbour|
        next if color_map[neighbour] != 0
        color_map[neighbour] = color
        stack.push(neighbour)
      end
    end
  end
  color_map
end

# create a map of equal and not equal. a letter can't be in both
# a == b b == c c == a
# eq map                non eq map
# a => b                  
# b => a
# b => c
# c => a

p equations_possible(["a==b","b==c","a!=c"])

p equations_possible ["c==c","b==d","x!=z"]



