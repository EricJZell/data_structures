class Squares
  attr_reader :range
  def initialize(number)
    @range = (1..number)
  end

  def square_of_sum
    @_square_of_sum ||= range.inject(&:+) ** 2
  end

  def sum_of_squares
    @_sum_of_squares ||= range.inject{ |sum, num| sum + num ** 2 }
  end

  def difference
    square_of_sum - sum_of_squares
  end
end
