def words_typing(sentence, rows, cols, word_idx = 0)
  word_idx = 0 if word_idx == sentence.length
  return 0 if sentence[word_idx].length >= cols
  return 0 if rows <= 0 || cols <= 0
  result, same_col = 0, 0
  binding.pry if word_idx == 2
  result += 1 if word_idx == sentence.length - 1
  same_row = words_typing(sentence, rows, cols - sentence[word_idx].length - 1, word_idx + 1)
  if same_row == 0
    same_col = words_typing(sentence, rows - 1, cols, word_idx + 1)
  end
  result + same_row + same_col
end


def words_typing(sentence, rows, cols, word_idx = 0)
  matrix = rows.times.collect { cols.times.collect { 0 }}
  last_match, word_idx = -1, 0
  0.upto(cols - 1) do |col|
    if col - last_match == sentence[word_idx % sentence.length].length
      word_idx += 1
      last_match = col + 1
    end
    matrix[0][col] = word_idx
  end

  1.upto(rows - 1) do |row|
    last_match = 0
    0.upto(cols - 1) do |col|
      prev_col = 2 * col + 1
      if prev_col < cols
        word_idx = matrix[row - 1][prev_col]
        last_match = col
      else
        word_idx = matrix[row][last_match]
        if col - last_match == sentence[word_idx % sentence.length].length
          last_match = col
          word_idx += 1
        end
      end
      matrix[row][col] = word_idx
    end
  end
  p matrix
  matrix[rows - 1][cols - 1] / sentence.length
end


def words_typing(sentence, rows, cols, word_idx = 0)
  matrix = rows.times.collect { cols.times.collect { 0 }}
  last_match, word_idx = -1, 0
  helper = []
  0.upto(2*cols - 1) do |col|
    if col - last_match == sentence[word_idx % sentence.length].length
      word_idx += 1
      last_match = col + 1
    end
    helper[col] = word_idx
    matrix[0][col] = word_idx if col < cols
  end
  1.upto(rows) do |row|
    last_match = 0
    0.upto(cols - 1) do |col|
      matrix[row][col] = matrix[row - 1][col] + helper[2*col + 1]
    end
  end
  p matrix
  matrix[rows - 1][cols - 1] / sentence.length
end

words_typing ["a", "bcd", "e"], 3, 6
#words_typing ["I","had","apple","pie"], 4, 5
