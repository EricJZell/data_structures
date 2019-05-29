class LogCutting
  PRICES = {1 => 1, 2 => 5, 3 => 8, 4 => 9, 5 => 10}

  def self.max(length)
    new.max(length)
  end

  def initialize
    @memo = {}
  end

  def max(length)
    return 0 if length <= 0
    @memo[length] ||= begin
      PRICES.select{ |l, _| l <= length }.map do |l, price|
        price + max(length - l)
      end.max
    end
  end
end


    
