puts "твое имя"
name = gets.chomp

puts "твой рост"
years = gets.chomp.to_i

sum = years.to_i - 110
if sum > 0
  puts "#{name}, ваш идеальный вес #{sum}."
else
  puts "#{name}, Ваш вес уже оптимальный"
end
