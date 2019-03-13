class Solution
  def initialize(n, blacklist)
    @n = n
    @blacklist = blacklist
  end

  def pick()
    random_num = rand(@n)
    while @blacklist.include?(random_num)
      random_num = rand(@n)
    end
    random_num
  end
end
obj = Solution.new(4,[2])
obj.pick
