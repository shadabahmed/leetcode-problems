def flatten_to_list(root)
  return [root, root] if root.nil?
  head, tail = root, root
  l_head, l_tail = flatten_to_list(root.left) if root.left
  r_head, r_tail = flatten_to_list(root.right) if root.right
  head, tail = if l_tail && r_head
                l_tail.right = r_head
                [l_head, r_tail]
              elsif l_tail
                [l_head, l_tail]
              else
                [r_head, r_tail]
              end
  root.right = head if head != root
  root.left = nil
  [root, tail]
end

def flatten(root)
  flatten_to_list(root).first
end


def get_head_tail(root)
  l_head, l_tail = flatten_to_list(root.left)
  r_head, r_tail = flatten_to_list(root.right)
  head, tail = if l_tail && r_head
                l_tail.right = r_head
                [l_head, r_tail]
              elsif l_tail
                [l_head, l_tail]
              elsif r_head
                [r_head, r_tail]
              else
                [root, root]
              end
end

def flatten_to_list(root)
  return [nil, nil] if root.nil?
  head, tail = get_head_tail(root)
  root.right = head if head != root
  root.left = nil
  [root, tail]
end

def flatten(root)
  flatten_to_list(root).first
end

def flatten(root, node = nil)
  return node if root.nil?
  node = flatten(root.right, node) if root.right
  node = flatten(root.left, node) if root.left
  root.right = node
  root.left = nil
  root
end
