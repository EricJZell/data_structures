class Series
  attr_reader :digits
  def initialize(digits)
    @digits = digits.chars
  end

  def slices(n)
    raise ArgumentError if n > digits.length
    digits.each_cons(n).map(&:join)
  end
end
