@price = {1 => 1, 2 => 5, 3 => 8}

def max_sales(length)
  return 0 if length <= 0
  @price.map do |l, p|
    p + max_sales(length - l)
  end.max
end
