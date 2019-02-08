puts "1 сторона треугольника"
a = gets.chomp.to_i

puts "2 сторона треугольника"
b = gets.chomp.to_i

puts "3 сторона треугольника"
c = gets.chomp.to_i

if a > b  && a > c
  boldlin = a

  if (boldlin**2) - (b**2) + (c**2) == 0
    puts "треугольник прямоугольный"
  else (boldlin**2) - (b**2) + (c**2) != 0
    puts "треугольник непрямоугольный"
  end

elsif c > b  && c > a
  boldlin = c
 
  if (boldlin**2) - (a**2) + (b**2) == 0
    puts "треугольник прямоугольный"
  else (boldlin**2) - (a**2) + (b**2) != 0
    puts "треугольник непрямоугольный"
  end

elsif b > a  && b > c
  boldlin = b
 
 	if (boldlin**2) - (a**2) + (c**2) == 0
 		puts "треугольник прямоугольный"
	else (boldlin**2) - (a**2) + (c**2) != 0
  		puts "треугольник непрямоугольный"
	end

else
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
