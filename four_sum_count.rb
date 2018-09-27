def four_sum_count(a, b, c, d)
  count = 0
  a.each do |a|
    b.each do |b|
      c.each do |c|
        d.each do |d|
          count += 1 if a + b+ c+ d == 0
        end
      end
    end
  end
end


def four_sum_count(a, b, c, d)
  cache, count = {}, 0
  c.each do |c|
    d.each do |d|
      cache[-1 * (c + d)] ||= 0
      cache[-1 * (c + d)] += 1
    end
  end
  a.each do |a|
    b.each do |b|
      count += cache[a + b] if cache.key?(a + b)
    end
  end
  count
end

p four_sum_count([-1,-1],
[-1,1],
[-1,1],
[1,-1])
