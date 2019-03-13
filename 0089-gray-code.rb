# @param {Integer} n
# @return {Integer[]}
def gray_code(n)
  gray_code_helper(n).collect{|x| x.to_i(2)}
end

# get codes for n - 1. Set nth bit 0 and the next array. Set nth bit 1 and reverse of next array
def gray_code_helper(n)
  prev = ['']
  while n > 0
    current = []
    prev.each do |prev_num|
      current << '0' + prev_num
    end
    prev.reverse.each do |prev_num|
      current << '1' + prev_num
    end
    prev = current
    n -= 1
  end
  prev
end


p gray_code 4
