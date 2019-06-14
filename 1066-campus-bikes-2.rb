# @param {Integer[][]} workers
# @param {Integer[][]} bikes
# @return {Integer}
INF = 1.0 / 0
def assign_bikes(workers, bikes, cache = {})
  return 0 if workers.empty?
  worker = workers.first
  return cache[[worker, bikes]] if cache.key?([worker, bikes])
  current_x, current_y = worker
  min = INF
  0.upto(bikes.length - 1) do |bike_idx|
    bikes[0], bikes[bike_idx] = bikes[bike_idx], bikes[0]
    bike_x, bike_y = bikes.first
    dist = (current_x - bike_x).abs + (current_y - bike_y).abs + assign_bikes(workers.drop(1), bikes.drop(1), cache)
    min = dist if dist < min
    bikes[0], bikes[bike_idx] = bikes[bike_idx], bikes[0]
  end
  cache[[worker, bikes]] = min
end



def assign_bikes(workers, bikes)
  a = AssignBikes.new
  a.assign(workers, bikes) 
  a.min 
end

class AssignBikes
  INF = 1.0 / 0
  attr_accessor :min
  def initialize    
    @min = INF    
  end

  def assign(workers, bikes, idx = 0, assigned = [], distance = 0)
    if idx == workers.length      
      self.min = distance if distance < min
      return
    end
    return if distance > min            
    current_x, current_y = workers[idx]
    0.upto(bikes.length - 1) do |bike_idx|
      next if assigned[bike_idx]
      assigned[bike_idx] = true
      bike_x, bike_y = bikes[bike_idx]
      dist = (current_x - bike_x).abs + (current_y - bike_y).abs + distance
      assign(workers, bikes, idx + 1, assigned, dist)
      assigned[bike_idx] = false
    end
  end
end


p assign_bikes workers = [[0,0],[2,1]], bikes = [[1,2],[3,3]]

p assign_bikes [[0,0],[1,0],[2,0],[3,0],[4,0],[5,0],[6,0],[7,0],[8,0]], [[0,999],[1,999],[2,999],[3,999],[4,999],[5,999],[6,999],[7,999],[8,999],[9,999]]