class Triangle
  attr_reader :sides
  def initialize(sides)
    @sides = sides
  end

  def equilateral?
    is_triangle? && sides.uniq.length == 1
  end

  def isosceles?
    is_triangle? && sides.uniq.length <= 2
  end

  def scalene?
    is_triangle? && sides.uniq.length == 3
  end

  private

  def is_triangle?
    @_is_triangle ||= begin
      sides.all?(&:positive?) && (sides.min(2).inject(&:+) >= sides.max)
    end
  end
end
