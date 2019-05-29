def isogram?(word)
  chars_array = word.downcase.chars
  chars_array.uniq.length == word.length
end

require 'rspec/autorun'

RSpec.describe "isogram?" do
  it "returns true if no duplicate letters" do
    expect(isogram?("abcdefghi")).to be true
  end

  it "returns false if letters repeated" do
    expect(isogram?("aa")).to be false
  end

  it "detects duplicats of different cases" do
    expect(isogram?("aA")).to be false
  end
end
