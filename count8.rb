class Count8
  def self.count(n)
    return 1 if n == 8
    return 0 if n < 10
    remaining_8s = count(n / 10)
    if n % 10 == 8
      if (n / 10) % 10 == 8
        2 + remaining_8s
      else
        1 + remaining_8s
      end
    else
      remaining_8s
    end
  end
end

require 'rspec/autorun'

RSpec.describe Count8 do
  describe '.count' do
    it 'counts a single 8' do
      expect(Count8.count(8)).to eq(1)
    end

    it 'counts multiple 8s' do
      expect(Count8.count(81818)).to eq(3)
    end

    it 'counts 8s with a neighbor 8 to the left twice' do
      expect(Count8.count(88188)).to eq(6)
    end
  end
end
