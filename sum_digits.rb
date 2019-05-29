class SumDigits
  def self.sum(n)
    return n if n < 10
    n % 10 + sum(n / 10)
  end
end

require 'rspec/autorun'

RSpec.describe SumDigits do
  describe '.sum' do
    it 'returns n if only 1 digit' do
      expect(SumDigits.sum(5)).to eq(5)
    end

    it 'returns the sum of digits if multiple digits' do
      expect(SumDigits.sum(271)).to eq(10)
    end
  end
end
