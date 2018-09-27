def dfs(rooms, room, visited)
  return if visited[room]
  visited[room] = true
  rooms[room].each do |next_room|
    dfs(rooms, next_room, visited)
  end
end

# @param {Integer[][]} rooms
# @return {Boolean}
def can_visit_all_rooms(rooms)
  visited = rooms.size.times.collect { false }
  dfs(rooms, 0, visited)
  visited.all?
end

p can_visit_all_rooms [[1], [2], [3], []]
p can_visit_all_rooms [[1, 3], [3, 0, 1], [2], [0]]
