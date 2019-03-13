# @param {String} dominoes
# @return {String}
def push_dominoes(dominoes)
  dominoes.length.times do
    
  end
    1.upto(dominoes.length - 1) do |idx|
      next unless dominoes[idx] == 'L'
      if dominoes[idx - 1] == '.'
        dominoes[idx - 1] = 'L'
      elsif dominoes[idx - 1] == 'R'
        dominoes[idx - 1] = '.'
      end
    end
    (dominoes.length - 2).downto(0) do |idx|
      next unless dominoes[idx] == 'R'
      if dominoes[idx + 1] == '.'
        dominoes[idx + 1] = 'R'
      elsif dominoes[idx + 1] == 'L'
        dominoes[idx + 1] = '.'
      end
    end
  end
  dominoes
end

push_dominoes ".L.R...LR..L.."
