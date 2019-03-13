def exact_match(s, t)
  return s.nil? && t.nil? if s.nil? || t.nil?
  t.val == s.val && exact_match(s.left, t.left) && exact_match(s.right, t.right)
end

def is_subtree(s, t)
  return s.nil? && t.nil? if s.nil? || t.nil?
  exact_match(s, t) || is_subtree(s.left, t) || is_subtree(s.right, t)
end
