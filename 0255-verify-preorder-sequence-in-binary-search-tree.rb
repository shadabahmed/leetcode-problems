# @param {Integer[]} preorder
# @return {Boolean}
def verify_preorder(preorder)
    
end

NEG_INF = -1.0 / 0
INF = 1.0 / 0
def verify_preorder(preorder, first = 0, last = preorder.length - 1, min = NEG_INF, max = INF)
  return true if first > last
  root = preorder[first]
  return false if root <= min || root >= max
  partition = first + 1
  partition += 1 while partition <= last && preorder[partition] < root
  verify_preorder(preorder, first + 1, partition - 1, min, root) &&
  verify_preorder(preorder, partition, last, root, max)
end


def verify_preorder(preorder)
  first, last = 0, preorder.length - 1
  while first < last
    if preorder[last] > preorder[first]
      last -= 1
    else
      first += 1
    end
  end
  [first, last]
end


def verify_preorder(preorder)
  stack = []
  root = -1.0 / 0
  preorder.each do |val|
    return false if root > val
    while !stack.empty? && val > stack.last
      root = stack.pop
    end
    stack.push(val)
  end
  true
end


def verify_preorder(preorder)
  root = -1.0 / 0
  i = -1
  preorder.each do |val|
    return false if root > val
    while i >= 0 && val > preorder[i]
      root = preorder[i]
      i -= 1
    end
    i += 1
    preorder[i] = val    
  end
  true
end


#p verify_preorder [5,2,6,1,3]
p verify_preorder [5,2,1,3,6]
p verify_preorder [1,3,4,2]


[5,2,1,3,6]