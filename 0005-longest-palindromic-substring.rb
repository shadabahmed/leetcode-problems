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
          idx += 1
        end
    end
    if longest % 2 == 0
      s.slice(longest_idx - longest/2 + 1, longest)
    else
      s.slice(longest_idx - (longest - 1)/2, longest)
    end
end
# p odd_palindrome_length('babad', 1)

%w[babad].each {|s| p longest_palindrome(s)}

class Trie
  def initialize
    @root = {}
  end

  def insert(s)
    parent = @root
    s.each_char do |c|
      parent[c] ||= {}
      parent = parent[c]
    end
  end

  def search(s, idx)
    parent = @root
    match_length = 0
    while idx < s.length && parent[s[idx]]
      parent = parent[s[idx]]
      idx += 1
      match_length += 1
    end
    match_length
  end
end


def longest_palindrome(s)
  trie = Trie.new
  max_len, max_palindrome = 0, ''
  (s.length - 1).downto(0) do |idx|
    trie.insert(s[0..idx].reverse)
  end 
  0.upto(s.length - 1) do |idx|
    match_len = trie.search(s, idx)
    if match_len > max_len
      max_len = match_len
      max_palindrome = s.slice(idx, match_len)
    end
  end
  max_palindrome
end

p longest_palindrome 'babad'