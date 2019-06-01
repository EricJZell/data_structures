class Scrabble
  LETTER_SCORES = {
    'AEIOULNRST' => 1, 'DG' => 2, 'BCMP' => 3, 'FHVWY' => 4, 'K' => 5, 'JX' => 8, 'QZ' => 10
  }
  def initialize(word)
    @word = word.to_s.upcase.strip
  end

  def score
    @word.chars.inject(0) do |sum, letter|
      letter_score = LETTER_SCORES.find{ |letters, score| letters.include?(letter) }[1]
      sum + letter_score
    end
  end

  def self.score(word)
    new(word).score
  end
end
