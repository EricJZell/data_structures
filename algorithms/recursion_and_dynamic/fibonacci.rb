require 'pry'
# Recursion using memoization
def fib(n)
  @memo ||= {}
  return n if n <= 1
  left = @memo[n - 1] || fib(n - 1)
  right = @memo[n - 2] || fib(n - 2)
  @memo[n] = left + right
end

# This and memoized have O(n)
def fib_iterative(n)
  return 0 if n <= 0
  return 1 if n == 1
  previous = [0, 1]
  for i in (2..n) do
    sum = previous.inject(:+)
    previous.push(sum)
    previous.shift
  end
  sum
end

#for recursion, the runtime is O(2^n), or exponential ( NOT Polynomial, which would be better)
def operations(n)
  sum = 0
  for i in (0..n)
    sum += (3 ** i)
  end
  puts sum
end




binding.pry
puts 'exiting'
