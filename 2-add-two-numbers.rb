# https://leetcode.com/problems/add-two-numbers/

def add_two_numbers(l1, l2)
  carry = 0
  sum_list_head = sum_list = ListNode.new(0)
  while l1 || l2
    sum = carry
    if l1
      sum += l1.val
      l1 = l1.next
    end
    if l2
      sum += l2.val
      l2 = l2.next
    end
    sum_list.next = ListNode.new(sum % 10)
    carry = sum / 10
    sum_list = sum_list.next
  end
  sum_list.next = ListNode.new(carry) if carry > 0
  sum_list_head.next
end

def add_two_numbers_part2(l1, l2)
  s1, s2, carry = [], [], 0
  while l1
    s1.push(l1)
    l1 = l1.next
  end
  while l2
    s2.push(l2)
    l2 = l2.next
  end
  sum_head = nil
  while !s1.empty? || !s2.empty?
    sum = carry
    if !s1.empty?
      sum += s1.pop.val
    end

    if !s2.empty?
      sum += s2.pop.val
    end
    node = ListNode.new(sum % 10)
    node.next = sum_head
    carry = sum / 10
    sum_head = node
  end
  if carry > 0
    node = ListNode.new(carry)
    node.next = sum_head
    sum_head = node
  end
  sum_head
end
