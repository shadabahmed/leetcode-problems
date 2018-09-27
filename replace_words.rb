# @param {String[]} dict
# @param {String} sentence
# @return {String}

class Trie
    attr_accessor :root, :children

    def initialize
        @children = {}
        @root = false
    end

    def add(word)
        parent, idx = self, 0
        word.chars.each do |chr|
            parent.children[chr] ||= Trie.new
            parent = parent.children[chr]
        end
        parent.root = true
    end

    def find_root(word, left, right)
        parent, idx = self, left
        while idx <= right
            parent = parent.children[word[idx]]
            return word[left..right] if parent.nil?
            return word[left..idx] if parent.root
            idx += 1
        end
        word[left..right]
    end
end


def replace_words(dict, sentence)
    trie, res = Trie.new, []
    dict.each do |word|
        trie.add(word)
    end
    left = 0
    while left < sentence.length
        right = left
        while right < sentence.length - 1 && sentence[right + 1] != ' '
            right += 1
        end
        res.push(trie.find_root(sentence, left, right))
        left = right + 2
    end
    res.join(' ')
end

p replace_words(["cat", "bat", "rat"], "the cattle was rattled by the battery")
