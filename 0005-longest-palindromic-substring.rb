# https://leetcode.com/problems/longest-palindromic-substring/

# @param {String} s
# @return {String}
def odd_palindrome_length(s, idx)
    first, last = idx - 1, idx + 1
    length = 1
    while first > -1 && last < s.length
        return length if s[first] != s[last]
        first -= 1
        last += 1
        length += 2
    end
    length
end
def even_palindrome_length(s, idx)
    first, last = idx, idx + 1
    length = 0
    while first > -1 && last < s.length
        return length if s[first] != s[last]
        first -= 1
        last += 1
        length += 2
    end
    length
end

def longest_palindrome(s)
    longest, longest_idx, idx = 1, 0, 0
    while idx < s.length
        pal_length = [odd_palindrome_length(s, idx), even_palindrome_length(s, idx)].max
        if pal_length > longest
          longest_idx = idx
          longest = pal_length
          idx +
        end
    end
    if longest % 2 == 0
      s.slice(longest_idx - longest/2 + 1, longest)
    else
      s.slice(longest_idx - (longest - 1)/2, longest)
    end
end
p odd_palindrome_length('babad', 1)

%w[babad].each {|s| p longest_palindrome(s)}
