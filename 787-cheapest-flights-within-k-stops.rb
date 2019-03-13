# @param {Integer} n
# @param {Integer[][]} flights
# @param {Integer} src
# @param {Integer} dst
# @param {Integer} k
# @return {Integer}
def find_cheapest_price(n, flights, src, dst, k)
  dp = []
  flights.each do |from, to, price|
    graph[from] ||= []
    graph[from] << [to, price]
  end
  explore_from_node(graph, src, dst, k + 1)
end
INF = 1.0 / 0
def explore_from_node(graph, starting_node, dst, k, visited = {})
  return 0 if starting_node == dst && k >= 0
  return -1 if k <= 0
  visited[starting_node] = true
  min_price = -1
  graph[starting_node].collect do |node, price|
    price_from_node = explore_from_node(graph, node, dst, k - 1, visited)
    if price_from_node >= 0
      total_price = price + price_from_node 
      min_price = total_price if total_price < min_price || min_price == - 1
    end
    price + explore_from_node(graph, node, dst, k - 1, visited)
  end
  visited[starting_node] = false
  min_price
end



def find_cheapest_price(n, flights, src, dst, k)
  dp = n.times.collect { -1 }
  dp[src] = 0
  graph = Hash.new {|h,k| h[k] = [] }
  flights.each do |from, to, price|
    graph[from] << [to, price]
  end
  queue = [src]
  while !queue.empty?
    node = queue.pop
    0.upto(n - 1) do |node|
      graph[node].each do |to_node, price|
        price = dp[node] + price
        dp[node] = price if dp[node] > price || dp[node] == -1
      end
    end
  end
  
  dp[dst]
end

p find_cheapest_price n = 3, edges = [[0,1,100],[1,2,100],[0,2,500]], src = 0, dst = 2, k = 1