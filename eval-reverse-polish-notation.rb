PROCS = {
  "+" => -> (y, x) { x + y },
  "-" => -> (y, x) { x - y },
  "*" => -> (y, x) { x * y },
  "/" => -> (y, x) { x.abs / y.abs * ((x * y).negative? ? -1 : 1) },
}

def eval_rpn(tokens)
  stack = []
  tokens.each do |token|
    if PROCS.key?(token)
      stack.push(PROCS[token].call(stack.pop(), stack.pop()))
    else
      stack.push(token.to_i)
    end
  end
  stack.last
end

#p eval_rpn ["6", "9", "3", "+", "-11", "*", "/"]
#p eval_rpn ["2", "1", "+", "3", "*"]
p eval_rpn ["10", "6", "9", "3", "+", "-11", "*", "/", "*", "17", "+", "5", "+"]
p eval_rpn ["4", "13", "5", "/", "+"]
