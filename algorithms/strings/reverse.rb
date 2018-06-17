
def reverse(string)
  mid = (string.length - 1) / 2
  for i in (0..mid) do
    tmp = string[i]
    string[i] = string[-i -1]
    string[-i -1] = tmp
  end
  string
end

puts reverse("1")
puts reverse("12")
puts reverse("123")
puts reverse("12345")
puts reverse("123456")
