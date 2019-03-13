require 'set'

VOWELS = Set.new(%w[a e i o u A E I O U])

def to_goat_latin(s)
  idx, word_end_idx, res = 0, 0, []
  word_count = 0
  while idx < s.length
    while s[idx] == ' '
      idx += 1
      word_end_idx += 1
    end
    while word_end_idx < s.length && s[word_end_idx] != ' '
      word_end_idx += 1
    end
    word_count += 1
    if VOWELS.include?(s[idx])
      p s[idx..(word_end_idx - 1)]
      res.push(s[idx..(word_end_idx - 1)] + 'ma' + 'a' * word_count)
    else
      p s[(idx + 1)..(word_end_idx - 1)]
      res.push(s[(idx + 1)..(word_end_idx - 1)] + s[idx] + 'ma' + 'a' * word_count)
    end
    idx = word_end_idx
  end
  res.join(' ')
end

to_goat_latin 'I am a goat'
