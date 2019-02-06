puts "твое имя"
name = gets.chomp

puts "твой рост"
years = gets.chomp

sum = years.to_i - 110
if sum.to_i > 0
puts "#{name}, ваш идиеальный вес #{sum}."
else
 puts "#{name}, Ваш вес уже оптимальный"
end