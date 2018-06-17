require 'pry'
def s_to_i(string)
  lookup = {
    "1" => 1, "2" => 2, "3" => 3, "4" => 4, "5" => 5,
    "6" => 6, "7" => 7, "8" => 8, "9" => 9, "0" => 0
  }
  accum = 0
  for i in (0..string.length - 1) do
    accum *= 10
    accum += lookup[string[i]]
  end
  accum
end

def binary_to_i(binary)
  accum = 0
  for i in (0..binary.length - 1) do
    accum = accum * 2
    accum += 1 if binary[i] == "1"
  end
  accum
end

binding.pry

puts 'exiting'
