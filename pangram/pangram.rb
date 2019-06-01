class Pangram
  def self.pangram?(sentence)
    sentence.upcase!
    sentence.scan(/[A-Z]/).uniq.length == 26
  end
end
