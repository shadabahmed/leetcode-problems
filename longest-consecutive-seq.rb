def longest_consecutive(nums)
  cache = {}
  largest_seq_len = 0
  ops = 1
  nums.each do |num|
    cache[num] = 1
  end

  nums.each do |num|
    if cache[num] == 1
      l_num = num - 1
      while cache.key?(l_num)
        l_num -= 1
      end
      (l_num + 2).upto(num) do |l_num|
        cache[l_num] += cache[l_num - 1] if cache[l_num] == 1
      end
    end
    largest_seq_len = cache[num] if cache[num] > largest_seq_len
  end
  largest_seq_len
end

def longest_consecutive(nums)
  cache, max_len = {}, 0
  nums.each do |num|
    cache[num] = true
  end

  nums.each do |num|
    unless cache.key?(num - 1)
      count = 1
      while cache.key?(num + 1)
        count += 1
        num += 1
      end
      max_len = count if count > max_len
    end
  end
  max_len
end
p longest_consecutive [1,2,0,1]
