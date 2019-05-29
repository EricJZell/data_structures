def duplicates(string)
  string.downcase.chars.group_by{ |c| c }
    .transform_values(&:count)
    .select{ |char, count| count >= 2 }
end
