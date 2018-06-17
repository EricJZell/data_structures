# Here, we start with c(0) = 1. That way, c(1) = 1 and c(2) = 2 and c(3) = 4
# The runtime complexity is (3^n + 3^n-1 + 3^n-2 ...) Or just 3^n
require 'pry'
# Recursion using memoization
def combos(steps)
  #We could say return 1 if steps = 0, but that doesn't feel right
  return 1 if steps == 1
  return 2 if steps == 2
  return 4 if steps == 3
  @memo ||= {}
  # We take the sum of the possible combinations if we take 1 step,
  #combinations if we take 2 steps, or combinations if we take 3 steps
  one_less = @memo[steps - 1] || combos(steps - 1)
  two_less = @memo[steps - 2] || combos(steps - 2)
  three_less = @memo[steps - 3] || combos(steps - 3)
  @memo[steps] = one_less + two_less + three_less
end

def combos_iterative(steps)
  # If we know that it is just the sum of the previous 3, we can do it iteratively:
  return 0 if steps <= 0
  previous = [0, 0, 1]
  for i in (1..steps) do
    sum = previous.inject(:+)
    previous.push(sum)
    previous.shift
  end
  sum
end

#for recursion, the runtime is O(3^n)
def operations(n)
  sum = 0
  for i in (0..n)
    sum += (3 ** i)
  end
  puts sum
end

binding.pry
puts 'exiting'
