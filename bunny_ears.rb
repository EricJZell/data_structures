class BunnyEars
  def self.count(number_of_bunnies)
    if number_of_bunnies.negative?
      raise ArgumentError.exception("use positive number of bunnies")
    end
    return 0 if number_of_bunnies.zero?
    return 2 if number_of_bunnies == 1
    return 2 + count(number_of_bunnies - 1)
  end
end
