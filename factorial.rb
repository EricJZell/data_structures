class Factorial
  def self.call(n)
    raise ArgumentError.exception("Call with positive integer") if n <= 0
    return 1 if n == 1
    return n * call(n -1)
  end
end

require 'rspec/autorun'

RSpec.describe Factorial do
  describe '.call' do
    it 'raises an argument error if called with negative number' do
      expect{ Factorial.call(0) }.to raise_error(ArgumentError)
    end

    it 'caculates the factorial of the argument' do
      expect(Factorial.call(5)).to eq(5 * 4 * 3 * 2 * 1)
    end
  end
end
