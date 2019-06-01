class Isogram
  def self.isogram?(word)
    word = word.downcase.gsub(/[^a-z]/, '')
    word.chars.uniq.length == word.length
  end
end
