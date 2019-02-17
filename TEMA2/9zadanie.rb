lets = {}
letters = ('a'..'z')
vowels = %w(a e i o u y)

letters.each.with_index(1) do |let, number|
  lets[let] = number if vowels.include?(let)
end
print lets
