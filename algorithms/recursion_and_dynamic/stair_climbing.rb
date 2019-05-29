class StairClimbing
  def self.combos(stairs)
    new.combos(stairs)
  end
  def initialize
    @memo = {}
  end
  def combos(stairs)
    @memo[stairs] ||= begin
      return 1 if stairs <= 1
      return 2 if stairs == 2
      return 4 if stairs == 3
      combos(stairs - 3) + combos(stairs - 2) + combos(stairs - 1)
    end
  end
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

binding.pry
puts 'exiting'
