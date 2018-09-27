def find_restaurant(list1, list2)
  map = {}
  list1.each_with_index do |item, idx|
    map[item] ||= 0
    map[item] = idx
  end
  min_sum = list1.length + list2.length
  res = nil
  list2.each_with_index do |item, idx|
    if map[item]
      sum = idx + map[item]
      if sum == min_sum
        res << item
      elsif sum < min_sum
        res = [item]
        min_sum = sum
      end
    end
  end
  res
end

find_restaurant ["Shogun","Tapioca Express","Burger King","KFC"],["KFC","Burger King","Tapioca Express","Shogun"]
