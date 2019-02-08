puts "1 коэффицент"
a = gets.chomp.to_i

puts "2 коэффицент"
b = gets.chomp.to_i

puts "3 коэффицент"
c = gets.chomp.to_i

d = (b**2) - (4 * a * b)
f = Math.sqrt(d)

if d < 0
  puts "дискриминант #{d} корней нет"
elsif d > 0
  per = (-1 * b) + f / (2 * a)
  vt = (-1 * b) - f / (2 * a)
  puts " дискриминант #{d}  первый корень #{per} второй корень #{vt}."
else  d = 0
  per = (-1 * b) / (2 * a)
  puts " дискриминант #{d}  первый корень #{per}" 
end

