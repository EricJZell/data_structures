require 'pry'
# Recursion with memoization O(p^n) (exponential) without memoization. With memoization: O(n)
@prices = {1 => 1, 2 => 5, 3 => 8, 4 => 9, 5 => 10}

def max_sales(length)
  @ops ||= 0
  @ops += 1
  @memo ||= {}
  return 0 if length <= 0
  current_potentials = @prices.select{ |l, p| l <= length }
  max_potential = current_potentials.map do |l, p|
    p + (@memo[length - l] || max_sales(length - l))
  end.max
  @memo[length] = max_potential
end


binding.pry
puts 'exiting'
