class Fibonacci
  def initialize
    @memo = {}
  end
  def calculate(n)
    @memo[n] ||= begin
      if n <= 1
        n
      else
        calculate(n - 1) + calculate(n - 2)
      end
    end
  end
end
