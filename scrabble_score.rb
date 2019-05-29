class ScrabbleScore
  LETTER_SCORES = {
    "a" => 6,
    "b" => 5,
    "c" => 1,
    "d" => 4,
    "e" => 7,
    "f" => 7,
    "g" => 1,
    "h" => 8,
    "i" => 1,
    "j" => 4,
    "k" => 8,
    "l" => 1,
    "m" => 8,
    "n" => 2,
    "o" => 2,
    "p" => 3,
    "q" => 9,
    "r" => 5,
    "s" => 4,
    "t" => 6,
    "u" => 9,
    "v" => 5,
    "w" => 7,
    "x" => 7,
    "y" => 6,
    "z" => 1
  }
  def self.compute(word)
    word.chars.inject(0){ |sum, letter| sum += LETTER_SCORES[letter] }
  end
end

require 'rspec/autorun'

RSpec.describe ScrabbleScore do
  describe '.compute' do
    it "sums up the letter scores" do
      expect(ScrabbleScore.compute("ok")).to eq(10)
    end
  end
end
