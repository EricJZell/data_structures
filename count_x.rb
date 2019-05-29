class CountX
  def self.count(string, start_index=0)
    return 0 if start_index >= string.length
    remaining = count(string, start_index + 1)
    string[start_index] == 'x' ? 1 + remaining : remaining
  end
end
