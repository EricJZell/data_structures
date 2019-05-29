class ExtractWords
  def self.call(string)
    string.scan(/\b[\w\']+\b/)
  end
  def self.call2(string)
    string.split(/\W*\s\W*/)
  end
end
