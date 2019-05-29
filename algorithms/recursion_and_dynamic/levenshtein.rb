class Leven
  def self.distance(string1, string2)
    new.distance(string1, string2)
  end

  def initialize
    @memo = {}
  end

  def distance(string1, string2)
    return string1.length if string2.empty?
    return string2.length if string1.empty?
    @memo[[string1, string2]] ||= begin
      [
        1 + distance(string1.chop, string2),
        1 + distance(string1, string2.chop),
        (string1[-1] == string2[-1] ? 0 : 1) +
          distance(string1.chop, string2.chop)
      ].min
    end
  end
end
