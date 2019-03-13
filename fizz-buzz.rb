def fizz_buzz(n)
  res = []
  1.upto(n) do |n|
    if n % 15 == 0
      res.push "FizzBuzz"
    elsif n % 3 == 0
      res.push "Fizz"
    elsif n % 5 == 0
      res.push "Buzz"
    else
      res.push n.to_s
    end
  end
  res
end
