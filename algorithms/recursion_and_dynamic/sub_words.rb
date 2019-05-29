class SubWords
  WORDS = ["candy", "land", "can", "and", "did", "fin", "new", "out", "fit"]

  def initialize(word)
    @word = word
  end

  def made_of_subwords?(string=@word)
    return true if WORDS.include?(string) && string != @word
    return false if string.length <= 1
    0.step(string.length - 2, 1) do |i|
      if made_of_subwords?(string[0..i]) && made_of_subwords?(string[i + 1..-1])
        return true
      end
    end
    false
  end
end
