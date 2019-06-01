class Phrase
  def initialize(phrase)
    @phrase = phrase
  end

  def word_count
    @phrase.downcase.scan(/\b[\w']+\b/).inject(Hash.new(0)) do |counts, word|
      counts[word] += 1
      counts
    end
  end
end
