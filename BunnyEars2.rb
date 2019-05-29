class BunnyEars2
  def self.count_ears(number_of_bunnies)
    raise ArgumentError.execption("Can't count negative bunnies' ears") if number_of_bunnies.negative?
    return 0 if number_of_bunnies.zero?
    return 2 if number_of_bunnies == 1
    rest_of_bunny_ears = count_ears(number_of_bunnies - 1)
    this_bunnies_ears = number_of_bunnies.odd? ? 2 : 3
    this_bunnies_ears + rest_of_bunny_ears
  end
end
