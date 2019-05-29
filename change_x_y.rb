class ChangeXY
  def self.change(string)
    return '' if string == ''
    remaining = change(string[1..-1])
    string[0] == 'x' ? 'y' + remaining : string[0] + remaining
  end
end
