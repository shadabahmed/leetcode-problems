def convert_to_title(n)
  title = []
  while n > 0
    rem = n % 26 == 0 ? 26 : n % 26
    title.unshift((rem + 64).chr)
    n = (n - 1) / 26
  end
  title.join
end
