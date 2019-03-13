class RecentCounter
  def initialize
    @timestamps = []
  end
  #  :type t: Integer
  #  :rtype: Integer
  def ping(t)
    while !@timestamps.empty? && @timestamps.first < t - 3000
      @timestamps.shift
    end
    @timestamps << t
    @timestamps.size
  end
end


t = RecentCounter.new
p t.ping(1)
p t.ping(100)
p t.ping(3001)
p t.ping(3002)