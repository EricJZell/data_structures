def fib(n)
  @memo ||= {}
  return n if n <= 1
  left = @memo[n - 1] || fib(n - 1)
  right = @memo[n - 2] || fib(n - 2)
  @memo[n] = left + right 
end
