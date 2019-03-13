def next_seq(seq)
  prev = seq.shift
  count = 1
  seq.length.times do
    current = seq.shift
    if prev == current
      count += 1
    else
      seq.push(count)
      seq.push(prev)
      prev = current
      count = 1
    end
  end
  seq.push(count)
  seq.push(prev)
end

def count_and_say(n)
  seq = [1]
  (n - 1).times do
    seq = next_seq(seq)
  end
  seq
end
count_and_say 2
