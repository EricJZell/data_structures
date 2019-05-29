class NegativeNumberError < StandardError
end
class Count7
  def self.count(n)
    raise NegativeNumberError if n.negative?
    return 1 if n == 7
    return 0 if n < 10
    remaining_7s = count(n / 10)
    n % 10 == 7 ? 1 + remaining_7s : remaining_7s
  end
end

require 'rspec/autorun'

RSpec.describe Count7 do
  describe '.count' do
    it 'raises an error on negative argument' do
      expect{ Count7.count(-1) }.to raise_error(NegativeNumberError)
    end

    it 'counts the 7s in a positive integer' do
      expect(Count7.count(7757)).to eq(3)
    end
  end
end
