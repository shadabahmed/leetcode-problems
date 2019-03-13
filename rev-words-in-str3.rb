# @param {String} s
# @return {String}

def rev_str(str, first, last)
    while first < last
        str[first], str[last] = str[last], str[first]
        first += 1
        last -= 1
    end
end

def reverse_words(s)
    idx = 0
    s = s.chars
    while idx < s.length - 1
        prev = idx
        while idx < s.length - 1 && s[idx + 1] != ' '
            idx += 1
        end
        rev_str(s, prev, idx)
        idx += 2
    end
    s.join
end

p reverse_words "Let's take LeetCode contest"
