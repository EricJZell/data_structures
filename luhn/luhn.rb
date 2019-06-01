class Luhn
  attr_reader :number
  def self.valid?(input)
    new(input).valid?
  end

  def initialize(input)
    @number = input.gsub(/\s/, '')
  end

  def valid?
    number.match(/^\d{2,}$/) && (checksum % 10).zero?
  end

  def checksum
    checksum_number = number.dup
    (2..number.length).step(2) do |i|
      digit = checksum_number[-i].to_i * 2
      digit -= 9 if digit > 9
      checksum_number[-i] = digit.to_s
    end
    checksum_number.chars.inject(0){ |sum, num| sum + num.to_i }
  end
end
