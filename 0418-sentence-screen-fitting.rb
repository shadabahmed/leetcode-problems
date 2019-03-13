# https://leetcode.com/problems/sentence-screen-fitting/

# @param {String[]} sentence
# @param {Integer} rows
# @param {Integer} cols
# @return {Integer}
def words_typing(sentence, rows, cols)
  word_lengths = []
  sentence.each_with_index do |word, idx|
    if idx.zero?
      word_lengths[idx] = word.length + 1
    else
      word_lengths[idx] = word.length + 1 + word_lengths[idx - 1]
    end
  end
  cache = {}
  idx = 0
  while true
    count, next_idx = get_next_idx_and_sentence_count(idx, cols, sentence, word_lengths)
    cache[idx] = [count, next_idx]
    break if cache[next_idx]
    idx = next_idx
  end
  idx = 0
  count = 0
  rows.times do
    current_count, idx = cache[idx]
    count += current_count
  end
  count
end

def get_next_idx_and_sentence_count(idx, len, sentence, word_lengths)
  count = 0
  current_idx = idx
  if idx != 0    
    while idx < sentence.length && len >= sentence[idx].length
      len -= sentence[idx].length + 1
      idx += 1
    end      
    if idx == sentence.length
      count += 1
      idx = 0
    end
    len = 0 if len < 0
  end
  if len > 0
    count += len / word_lengths[-1]
    remaining_chars = len % word_lengths[-1]
    next_idx = bin_search(word_lengths, remaining_chars)
    if next_idx == sentence.length
      count += 1
      next_idx = 0
    end    
    [count, next_idx]
  else
    [count, idx]
  end  
end

def bin_search(word_lengths, len)
  first, last = 0, word_lengths.length - 1
  while first <= last
    mid = (first + last) / 2
    return mid + 1 if len == word_lengths[mid] || len == word_lengths[mid] - 1
    if len > word_lengths[mid]
      first = mid + 1
    else
      last = mid - 1
    end
  end
  first
end

# @param {String[]} sentence
# @param {Integer} rows
# @param {Integer} cols
# @return {Integer}
def words_typing1(sentence, rows, cols)
  cache = {}
  idx = 0
  while true
    count, next_idx = get_next_idx_and_sentence_count(idx, cols, sentence)
    cache[idx] = [count, next_idx]
    break if cache[next_idx]
    idx = next_idx
  end
  idx = 0
  count = 0
  rows.times do
    current_count, idx = cache[idx]
    count += current_count
  end
  count
end

def get_next_idx_and_sentence_count1(idx, len, sentence)
  count, word_count = 0, 0
  while len >= sentence[idx].length
    len -= sentence[idx].length + 1
    idx += 1
    if idx == sentence.length
      count += 1
      idx = 0
    end
  end
  [count, idx]
end



rows = 4 
cols = 5
sentence = ["I", "had", "apple", "pie"]
p words_typing sentence, rows, cols
 

# rows = 2
# cols = 8
# sentence = ["hello", "world"]
# p words_typing sentence, rows, cols

sentence = ["try","to","be","better"]
rows = 10000
cols = 9001
p words_typing sentence, rows, cols
