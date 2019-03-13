# @param {String[]} words1
# @param {String[]} words2
# @param {string[][]} pairs
# @return {Boolean}
require "set"

def are_sentences_similar(words1, words2, pairs)
  return false if words1.length != words2.length
  map = Hash.new { |h, k| h[k] = Set.new }
  pairs.each do |first, second|
    map[first] << second
    map[second] << first
  end
  0.upto(words1.length - 1) do |idx|
    return false if words1[idx] != words2[idx] && !map[words1[idx]].include?(words2[idx])
  end
  true
end

p are_sentences_similar ["an", "extraordinary", "meal"],
                        ["one", "good", "dinner"],
                        [["great", "good"], ["extraordinary", "good"], ["well", "good"], ["wonderful", "good"], ["excellent", "good"], ["fine", "good"], ["nice", "good"], ["any", "one"], ["some", "one"], ["unique", "one"], ["the", "one"], ["an", "one"], ["single", "one"], ["a", "one"], ["truck", "car"], ["wagon", "car"], ["automobile", "car"], ["auto", "car"], ["vehicle", "car"], ["entertain", "have"], ["drink", "have"], ["eat", "have"], ["take", "have"], ["fruits", "meal"], ["brunch", "meal"], ["breakfast", "meal"], ["food", "meal"], ["dinner", "meal"], ["super", "meal"], ["lunch", "meal"], ["possess", "own"], ["keep", "own"], ["have", "own"], ["extremely", "very"], ["actually", "very"], ["really", "very"], ["super", "very"]]
