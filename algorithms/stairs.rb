def combos(steps)
  return 1 if steps == 1
  return 2 if steps == 2
  return 4 if steps == 3
  @memo ||= {}
  one_less = @memo[steps - 1] || combos(steps - 1)
  two_less = @memo[steps - 2] || combos(steps - 2)
  three_less = @memo[steps - 3] || combos(steps - 3)
  @memo[steps] = one_less + two_less + three_less
end
