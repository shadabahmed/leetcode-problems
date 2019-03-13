# @param {Integer[]} nums
# @return {String}
def largest_number(nums)
  if nums.all?(&:zero?)
    '0'
  else
    nums.sort{|i, k| compare(k, i)}.join
  end
end

def compare(i, k)
  len_i, len_k = len(i), len(k)
  if len_i != len_k
    i_first = i * 10 ** len_k + k
    k_first = k * 10 ** len_i + i
    i_first <=> k_first
  else
    i <=> k
  end  
end

def len(i)
  length = 1
  while i >= 10
    i /= 10
    length += 1
  end
  length
end

x = [121,12]
x = [0,0]
p largest_number(x)
