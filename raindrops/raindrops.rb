class Raindrops
  CONVERSIONS = {
    3 => "Pling", 5 => "Plang", 7 => "Plong"
  }
  def self.convert(n)
    result = CONVERSIONS.inject("") do |converted, (factor,sound)|
      converted += sound if (n % factor).zero?
      converted
    end
    result.empty? ? n.to_s : result
  end
end
