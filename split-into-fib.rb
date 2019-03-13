def split_into_fibonacci(s, last = s.length - 1)
  return [s.first.to_i, s.second.to_i] if s.length == 1
  last.downto(0) do |idx|
    #next if idx < last - 1 && s[idx] == '0'
    current = s[idx..last].to_i
    prev_seq = split_into_fibonacci(s, idx - 1)
    if prev_seq.length > 1 && prev_seq[-1] + prev_seq[-2] = current
      return prev_seq.push(current)
    end
  end
  []
end


def split_into_fibonacci(s, last = s.length - 1)
  0.upto(last - 2) do |split1_idx|
    (split1_idx + 1).upto(last - 1) do |split2_idx|
      num1 = s[0..split1_idx].to_i
      num2 = s[(split1_idx + 1)..split2_idx].to_i
      num3 = s[(split2_idx + 1)..last].to_i
      if num3 == num1 + num2
        p 'dsdssd'
      end
    end
  end
end


def split_into_three(s, last)
  0.upto(last - 1) do |split1_idx|
    (split1_idx + 1).upto(last) do |split2_idx|
      next if split1_idx > 1 && s[0] == '0' ||
              split2_idx - split1_idx > 2 && s[split1_idx + 1] == '0' ||
              last - split2_idx > 2 && s[split2_idx + 1] == '0'
      num1 = s[0..split1_idx].to_i
      num2 = s[(split1_idx + 1)..split2_idx].to_i
      num3 = s[(split2_idx + 1)..last].to_i
      if num3 == num1 + num2
        return [num1, num2, num3]
      end
    end
  end
  []
end

def split_into_fibonacci(s)
  dp = [[],[],[]]
  3.upto(s.length) do |n|
    2.upto(n - 1) do |prev_n|
      if !dp[prev_n].empty?
        next if s[prev_n + 1] == '0' && n - prev_n > 2
        current = s[(prev_n + 1)..n].to_i
        if current = dp[prev_n][-1] + dp[prev_n][-2]
          dp[n] = dp[prev_n] + [current]
        end
      end
    end
    dp[n] = split_into_three(s, n - 1) if !dp[n]
  end
  p dp
  dp[s.length]
end

split_into_fibonacci '11235813'
