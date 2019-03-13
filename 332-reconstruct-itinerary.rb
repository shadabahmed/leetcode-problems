# @param {string[][]} tickets
# @return {String[]}
def find_itinerary(tickets)
  map = Hash.new{|h,k| h[k] = []}
  tickets.each_with_index do |(from, to), idx|
    map[from] << [to, idx]
  end
  map.values.each do |v|
    v.sort_by!{|a| a[0]}
  end
  res = []
  dfs('JFK', map, res, tickets.count)
  res
end

def dfs(from, map, res, tickets, visited = Set.new())
  res << from
  return true if tickets.zero?
  map[from].each do |neighbour, ticket_id|
    key = "#{from},#{neighbour},#{ticket_id}"
    next if visited.include?(key)
    visited << key
    if dfs(neighbour, map, res, tickets - 1, visited)
      return true
    else
      visited.delete(key)
    end
  end
  res.pop
  false
end

def find_itinerary(tickets)
  tickets = tickets.sort.reverse.group_by(&:first)
  route, stack = [], ["JFK"]
  while stack.any?
    stack << tickets[stack[-1]].pop()[1] while (tickets[stack[-1]] || []).any?
    route << stack.pop()
  end
  route.reverse
end

["JFK","ANU","EZE","AXA","TIA","ANU","JFK","TIA","ANU","TIA","JFK"]

 p find_itinerary [["MUC", "LHR"], ["JFK", "MUC"], ["SFO", "SJC"], ["LHR", "SFO"]]

# ["JFK", "MUC", "LHR", "SFO", "SJC"]

p find_itinerary [["JFK","SFO"],["JFK","ATL"],["SFO","ATL"],["ATL","JFK"],["ATL","SFO"]]

# ["JFK","ATL","JFK","SFO","ATL","SFO"]

p find_itinerary [["JFK","KUL"],["JFK","NRT"],["NRT","JFK"]]


p find_itinerary [["EZE","AXA"],["TIA","ANU"],["ANU","JFK"],["JFK","ANU"],["ANU","EZE"],["TIA","ANU"],["AXA","TIA"],["TIA","JFK"],["ANU","TIA"],["JFK","TIA"]]

["JFK","ANU","EZE","AXA","TIA","ANU","JFK","TIA","ANU","TIA","JFK"]
# JFK -> KUL -> ???- backtrack
# JFK - NRT -
