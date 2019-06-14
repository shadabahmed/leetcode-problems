# @param {String[]} ops
# @return {Integer}
def cal_points(ops)
  stack = [0]
  ops.each do |x|
    if x == 'C'
      stack.pop
    elsif x == 'D'
      stack.push(stack.last * 2)
    elsif x == '+'
      stack.push(stack.last + stack[-2])
    else
      stack.push(x.to_i)
    end
  end    
  stack.sum
end

p cal_points ["5","2","C","D","+"]
p cal_points ["5","-2","4","C","D","9","+","+"]