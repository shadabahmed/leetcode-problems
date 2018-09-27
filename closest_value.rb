def closest_value(root, target)
  child_closest = if target > root && root.right
                    closest_value(root.right, target)
                  elsif target < root && root.left
                    closest_value(root.right, target)
                  else
                    root.val
                  end
  (target - root.val).abs < (target - child_closest).abs ? root.val : child_closest    
end
