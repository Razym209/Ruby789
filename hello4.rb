puts "1 коэффицент"
a = gets.chomp

puts "2 коэффицент"
b = gets.chomp

puts "3 коэффицент"
c = gets.chomp

d= (b.to_i**2) - (4 * a.to_i * b.to_i)
if d < 0
puts "дискриминант #{d} корней нет"
elsif d > 0
	per = (-1*b.to_i) + (Math.sqrt(d.to_i)) / (2*a.to_i)
	vt = (-1*b.to_i) - (Math.sqrt(d.to_i)) / (2*a.to_i)
	puts " дискриминант #{d}  первый корень #{per} второй корень #{vt}."
else  d = 0
	per = (-1*b.to_i) + (Math.sqrt(d.to_i)) / (2*a.to_i)
	puts " дискриминант #{d}  первый корень #{per}" 
end

