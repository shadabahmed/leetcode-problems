# Idead

# N = 4, K = 2
# if K < N / 2
#  process(N/2, K)
def kth_grammar(n, k, base = 0)
  return base if k == 1
  half_length = 2 ** (n - 2)
  if k > half_length
    kth_grammar(n - 1, k - half_length, base.zero? ? 1 : 0)
  else
    kth_grammar(n  - 1, k, base)
  end
end

def kth_grammar(n, k)
  base = 0
  while k > 1
    half_length = 2 ** (n - 2)
    if k > half_length
      k -= half_length
      base = base.zero? ? 1 : 0
    end
    n -= 1
  end
  base   
end



p kth_grammar(4, 3)