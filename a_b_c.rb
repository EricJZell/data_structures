class ABC
  def self.count(string)
    return 0 if string.length <= 2
    remaining = count(string[1..-1])
    string[0..2].match?(/ab[ca]/) ? 1 + remaining : remaining
  end
end

require 'rspec/autorun'

RSpec.describe ABC do
  describe '.count' do
    it 'counts aba and abc occurences' do
      string = 'abajsdfabdsabcsdabaabcabd'
      expect(ABC.count(string)).to eq(string.scan(/ab[ca]/).count)
    end
  end
end
