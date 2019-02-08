puts "1 сторона треугольника"
a = gets.chomp.to_i

puts "2 сторона треугольника"
b = gets.chomp.to_i

puts "3 сторона треугольника"
c = gets.chomp.to_i

if a > b && a > c
  boldlin = a
  lin1 = b
  lin2 = c
elsif b > a && b > c
  boldlin = b
  lin1 = a
  lin2 = c
elsif c > b && c > a
  boldlin = c
  lin1 = a
  lin2 = b
end

if (boldlin**2) - (lin1**2) + (lin2**2) == 0
   puts "треугольник прямоугольный"
else (boldlin**2) - (lin1**2) + (lin2**2) != 0
  puts "треугольник непрямоугольный"
end

if a = b = c 
  puts "треугольник равносторонний"
else
  puts "треугольник неравносторонний"
end

if a = b || a = c || b = с
  puts "треугольник равнобедренный"
else
  puts "треугольник неравнобедренный"	
end
