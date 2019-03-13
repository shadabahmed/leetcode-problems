class PriorityQueue
  attr_accessor :arr, :comparator
  def initialize(&block)
    self.arr = []
    self.comparator = block
  end

  def compare(first_idx, other_idx)
    comparator.call(arr[first_idx], arr[other_idx])
  end

  def swap(first_idx, other_idx)
    arr[first_idx], arr[other_idx] = arr[other_idx], arr[first_idx]
  end

  def parent(idx)
    (idx - 1) / 2
  end

  def left(idx)
    2 * idx + 1
  end

  def right(idx)
    2 * idx + 2
  end

  def heapify_up(idx)
    return if idx >= size || idx <= 0
    parent_idx = parent(idx)
    if compare(idx, parent_idx)
      swap(idx, parent_idx)
      heapify_up(parent_idx)
    end
  end

  def heapify_down(idx)
    return if idx >= size || idx < 0
    left_idx = left(idx)
    right_idx = right(idx)
    priority_idx = idx
    priority_idx = left_idx if left_idx < size && compare(left_idx, priority_idx)
    priority_idx = right_idx if right_idx < size && compare(right_idx, priority_idx)
    if priority_idx != idx
      swap(idx, priority_idx)
      heapify_down(priority_idx)
    end
  end

  def insert(item)
    arr << item
    heapify_up(arr.size - 1)
  end

  def delete_top
    last = arr.pop
    if !arr.empty?
      top = arr[0]
      arr[0] = last
      heapify_down(0)
      top
    else
      last
    end    
  end

  def top
    arr[0]
  end

  def size
    arr.size
  end

  def empty?
    arr.empty?
  end
end

class MaxStack
  #     initialize your data structure here.
  attr_accessor :stack, :pq, :stack_del_map, :pq_del_map
  def initialize()
    self.stack = []
    self.pq = PriorityQueue.new {|a,b| a > b}
    self.stack_del_map = Hash.new(0)
    self.pq_del_map = Hash.new(0)
  end

  #     :type x: Integer
  #     :rtype: Void
  def push(x)
    stack.push(x)
    pq.insert(x)
    nil
  end

  # :rtype: Integer
  def pop    
    while !stack.empty? && stack_del_map[stack.last] > 0
      stack_del_map[stack.pop] -= 1
    end
    top = stack.pop
    while !stack.empty? && stack_del_map[stack.last] > 0
      stack_del_map[stack.pop] -= 1
    end
    if pq.top == top
      pq.delete_top
    else
      pq_del_map[top] += 1
    end
    top
  end

  #     :rtype: Integer
  def top
    while !stack.empty? && stack_del_map[stack.last] > 0
      stack_del_map[stack.pop] -= 1
    end    
    stack.last
  end

  #     :rtype: Integer
  def peek_max
    while !pq.empty? && pq_del_map[pq.top] > 0
      pq_del_map[pq.delete_top] -= 1
    end
    pq.top
  end

  #     :rtype: Integer
  def pop_max
    while !pq.empty? && pq_del_map[pq.top] > 0
      pq_del_map[pq.delete_top] -= 1
    end    
    top = pq.delete_top
    while !pq.empty? && pq_del_map[pq.top] > 0
      pq_del_map[pq.delete_top] -= 1
    end
    if top == stack.last
      stack.pop
    else
      stack_del_map[top] += 1
    end
    top
  end
end


# Your MaxStack object will be instantiated and called as such:

# obj.push(6)
# obj.push(5)
# obj.push(4)
# obj.push(3)
# p obj.pop_max
# p obj.top
# p obj.peek_max
# p obj.pop_max
# p obj.top
# p obj.pop
# p obj.pop
# p obj.pop
# param_2 = obj.pop()
# param_3 = obj.top()
# param_4 = obj.peek_max()
# param_5 = obj.pop_max()
obj = MaxStack.new()
commands = ["MaxStack","push","peekMax","push","peekMax","push","pop","pop","push","peekMax","push","popMax","top","push","push","peekMax","popMax","popMax"]
inputs = [[],[92],[],[54],[],[22],[],[],[-57],[],[-24],[],[],[26],[-71],[],[],[]]
outputs = [nil,nil,92,nil,92,nil,22,54,nil,92,nil,92,-24,nil,nil,26,26,-24]


commands = ["MaxStack","push","pop","push","popMax","push","popMax","push","pop","push","peekMax","push","popMax","top","push","peekMax","popMax","top","popMax","push","push","top","push","push","popMax","push","push","push","push","popMax","push","top","push","push","push","popMax","popMax","push","popMax","push","popMax","push","pop","top","push","push","push","pop","push","pop","peekMax","push","peekMax","popMax","top","pop","top","push","top","push","pop","push","top","popMax","peekMax","peekMax","push","push","popMax","push","push","push","push","push","peekMax","peekMax","push","push","peekMax","push","push","popMax","pop","top","pop","popMax","pop","peekMax","popMax","push","push","push","push","popMax","push","top","peekMax","popMax","pop","pop","pop","push","top","push","push","pop","push","peekMax","push","push","peekMax","push","push","popMax","top","push","push","top","pop","push","top","push","push","popMax","push","pop","push","pop","push","push","pop","pop","popMax","push","peekMax","top","push","top","push","top","top","popMax","top","push","pop","pop","top","push","push","push","popMax","push","push","push","popMax","push","push","push","push","push","top","pop","push","push","popMax","peekMax","popMax","push","peekMax","top","peekMax","push","top","peekMax","top","peekMax","push","push","push","popMax","push","top","top","popMax","push","pop","push","peekMax","push","pop","push","top","pop","push","popMax","push","push","push","top","push","peekMax","peekMax","push","popMax","peekMax","push","pop","pop","peekMax","popMax","popMax","popMax","top","push","peekMax","peekMax","popMax","push","push","push","push","push","popMax","peekMax","pop","pop","top","push","peekMax","peekMax","pop","push","peekMax","top","push","pop","pop","top","top","pop","popMax","push","top","popMax","popMax","peekMax","push","push","pop","pop","push","push","push","popMax","pop","push","top","popMax","popMax","popMax","push","pop","push","push","push","push","push","push","pop","push","pop","pop","top","push","push","top","popMax","push","pop","peekMax","popMax","top","push","top","push","popMax","peekMax","push","top","push","top","top","top","top","pop","push","push","top","pop","top","popMax","popMax","push","peekMax","push","top","pop","push","push","push","push","pop","popMax","top","peekMax","pop","top","push","pop","pop","pop","pop","popMax","peekMax","pop","push","push","top","push","peekMax","push","top","popMax","push","push","push","popMax","top","pop","pop","push","pop","push","top","pop","push","pop","push","push","push","top","peekMax","top","push","popMax","popMax","top","popMax","popMax","push","popMax","top","push","peekMax","push","popMax","push","top","top","pop","peekMax","top","popMax","push","push","push","peekMax","push","popMax","push","top","pop","peekMax","push","push","peekMax","popMax","push","push","push","pop","popMax","top","push","push","push","pop","push","peekMax","popMax","top","popMax","popMax","top","peekMax","peekMax","peekMax","top","push","popMax","top","top","top","top","push","pop","push","popMax","push","top","pop","peekMax","top","pop","push","popMax","peekMax","peekMax","push","popMax","push","push","push","peekMax","push","push","push","top","push","pop","push","popMax","top","pop","push","push","push","push","top","push","peekMax","popMax","push","top","popMax","push","pop","pop","peekMax","peekMax","peekMax","push","pop","peekMax","peekMax","popMax","pop","push","popMax","pop","push","top","pop","push","push","push","push","push","pop","top","popMax","push","top","push","pop","push","push","top","push","top","pop","push","push","popMax","pop","push","push","push","popMax","peekMax","push","top","popMax","popMax","push","push","top","pop","push","push","push","pop","popMax","pop","push","push","push","push","push","pop","push","popMax","push","push","top","pop","peekMax","push","popMax","push","push","push","pop","push","push","push","popMax","push","push","peekMax","push","top","pop","top","popMax","popMax","pop","pop","pop","push","push","push","push","push","push","push","push","push","top","popMax","push","popMax","top","push","top","popMax","pop","popMax","pop","popMax","push","pop","push","push","push","pop","pop","peekMax","push","top","push","peekMax","push","popMax","push"]
inputs = [[],[70],[],[73],[],[76],[],[-13],[],[-7],[],[50],[],[],[89],[],[],[],[],[18],[12],[],[-64],[95],[],[-81],[64],[-39],[12],[],[-13],[],[-93],[54],[51],[],[],[31],[],[3],[],[72],[],[],[68],[-84],[39],[],[-25],[],[],[-89],[],[],[],[],[],[65],[],[15],[],[61],[],[],[],[],[54],[-43],[],[95],[-24],[-66],[36],[-40],[],[],[39],[-3],[],[28],[70],[],[],[],[],[],[],[],[],[-8],[-85],[60],[65],[],[100],[],[],[],[],[],[],[-69],[],[-37],[-23],[],[-100],[],[-94],[13],[],[88],[-77],[],[],[-67],[-23],[],[],[-100],[],[4],[25],[],[-4],[],[-38],[],[-42],[54],[],[],[],[-48],[],[],[-34],[],[-1],[],[],[],[],[32],[],[],[],[86],[-97],[94],[],[-27],[-52],[88],[],[54],[-49],[-24],[39],[-85],[],[],[-66],[-21],[],[],[],[-62],[],[],[],[30],[],[],[],[],[24],[99],[36],[],[63],[],[],[],[66],[],[-48],[],[7],[],[23],[],[],[72],[],[95],[46],[55],[],[98],[],[],[-63],[],[],[-10],[],[],[],[],[],[],[],[-2],[],[],[],[-45],[14],[-72],[1],[-78],[],[],[],[],[],[-35],[],[],[],[-26],[],[],[80],[],[],[],[],[],[],[-76],[],[],[],[],[15],[-3],[],[],[-97],[26],[74],[],[],[9],[],[],[],[],[-52],[],[98],[13],[-89],[-83],[31],[-90],[],[27],[],[],[],[-49],[-83],[],[],[77],[],[],[],[],[89],[],[-62],[],[],[19],[],[-79],[],[],[],[],[],[37],[37],[],[],[],[],[],[-66],[],[1],[],[],[-54],[-4],[66],[56],[],[],[],[],[],[],[30],[],[],[],[],[],[],[],[12],[-53],[],[57],[],[-41],[],[],[-58],[-56],[-59],[],[],[],[],[23],[],[87],[],[],[-58],[],[-25],[-100],[-89],[],[],[],[-78],[],[],[],[],[],[71],[],[],[-57],[],[27],[],[-34],[],[],[],[],[],[],[-93],[58],[50],[],[92],[],[84],[],[],[],[13],[18],[],[],[92],[66],[42],[],[],[],[-2],[50],[-65],[],[9],[],[],[],[],[],[],[],[],[],[],[53],[],[],[],[],[],[-78],[],[5],[],[-53],[],[],[],[],[],[9],[],[],[],[-23],[],[-24],[-97],[-92],[],[-16],[76],[81],[],[94],[],[41],[],[],[],[88],[89],[-73],[4],[],[-47],[],[],[-24],[],[],[-98],[],[],[],[],[],[2],[],[],[],[],[],[-70],[],[],[-61],[],[],[83],[-77],[28],[62],[51],[],[],[],[-98],[],[40],[],[-54],[-84],[],[61],[],[],[56],[-3],[],[],[15],[53],[50],[],[],[99],[],[],[],[4],[-78],[],[],[-67],[-96],[63],[],[],[],[36],[83],[49],[9],[46],[],[71],[],[69],[36],[],[],[],[-46],[],[1],[24],[-35],[],[-1],[-83],[-42],[],[56],[-83],[],[-27],[],[],[],[],[],[],[],[],[-71],[32],[100],[33],[-91],[-50],[-15],[-98],[-74],[],[],[21],[],[],[48],[],[],[],[],[],[],[96],[],[23],[45],[38],[],[],[],[-100],[],[-34],[],[-68],[],[-46]]
outputs = [nil,nil,70,nil,73,nil,76,nil,-13,nil,-7,nil,50,-7,nil,89,89,-7,-7,nil,nil,12,nil,nil,95,nil,nil,nil,nil,64,nil,-13,nil,nil,nil,54,51,nil,31,nil,18,nil,72,3,nil,nil,nil,39,nil,-25,68,nil,68,68,-89,-89,-84,nil,65,nil,15,nil,61,65,61,61,nil,nil,61,nil,nil,nil,nil,nil,95,95,nil,nil,95,nil,nil,95,70,28,28,54,-3,39,39,nil,nil,nil,nil,65,nil,100,100,100,60,-85,-8,nil,-69,nil,nil,-23,nil,36,nil,nil,36,nil,nil,88,-77,nil,nil,-23,-23,nil,-100,nil,nil,36,nil,-4,nil,-38,nil,nil,54,-42,25,nil,13,-48,nil,-34,nil,-1,-1,13,-1,nil,32,-1,-34,nil,nil,nil,94,nil,nil,nil,88,nil,nil,nil,nil,nil,-85,-85,nil,nil,86,54,54,nil,39,-62,39,nil,30,39,30,39,nil,nil,nil,99,nil,63,63,63,nil,66,nil,39,nil,7,nil,23,23,nil,72,nil,nil,nil,55,nil,98,98,nil,98,95,nil,-10,-63,95,95,55,46,-48,nil,39,39,39,nil,nil,nil,nil,nil,36,30,-78,1,-72,nil,30,30,-35,nil,30,-26,nil,80,-26,-72,-72,-72,30,nil,-76,24,14,12,nil,nil,-3,15,nil,nil,nil,74,26,nil,9,12,12,9,nil,-52,nil,nil,nil,nil,nil,nil,-90,nil,27,31,-83,nil,nil,-83,98,nil,77,13,13,-83,nil,89,nil,89,4,nil,19,nil,-79,-79,-79,-79,-79,nil,nil,37,37,37,37,19,nil,4,nil,1,1,nil,nil,nil,nil,56,66,-4,4,-4,-54,nil,30,-54,-66,-62,4,3,-83,nil,nil,-53,nil,57,nil,-41,57,nil,nil,nil,12,-59,-59,-56,nil,23,nil,87,87,nil,-58,nil,nil,nil,-89,3,-89,nil,3,-2,-78,-13,-21,nil,71,-78,nil,-24,nil,27,nil,-34,-34,-34,-24,-57,-24,nil,nil,nil,58,nil,92,nil,84,84,58,nil,nil,58,58,nil,nil,nil,42,92,66,nil,nil,nil,-65,nil,66,66,9,50,50,9,18,18,18,9,nil,53,9,9,9,9,nil,-78,nil,18,nil,-53,-53,13,5,5,nil,13,9,9,nil,9,nil,nil,nil,9,nil,nil,nil,81,nil,94,nil,81,41,41,nil,nil,nil,nil,4,nil,89,89,nil,-24,88,nil,-98,-24,76,76,76,nil,2,76,76,76,-47,nil,9,-70,nil,-61,-61,nil,nil,nil,nil,nil,51,62,83,nil,-98,nil,40,nil,nil,-84,nil,61,61,nil,nil,62,-3,nil,nil,nil,56,53,nil,99,99,53,nil,nil,-78,-78,nil,nil,nil,63,50,-96,nil,nil,nil,nil,nil,46,nil,83,nil,nil,36,36,71,nil,71,nil,nil,nil,-35,nil,nil,nil,69,nil,nil,56,nil,-27,-27,-83,56,49,-83,-42,-83,nil,nil,nil,nil,nil,nil,nil,nil,nil,-74,100,nil,36,21,nil,48,48,21,33,-74,32,nil,96,nil,nil,nil,38,45,28,nil,-100,nil,28,nil,28,nil]

1.upto(commands.length - 1) do |idx|
  command = commands[idx]
  input = inputs[idx].first
  p "#{command} #{input}"
  if command == "push"
    p obj.push(input)
  elsif command == "peekMax"
    p obj.peek_max
  elsif command == "pop"
    p obj.pop
  elsif command == "top"
    p obj.top
  elsif command == "popMax"
    p obj.pop_max
  end
  p outputs[idx]
  puts
end