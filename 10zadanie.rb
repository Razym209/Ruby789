
hisla_mesiz = [31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31]

puts 'день'
den = gets.chomp.to_i

puts 'месяц'
mesiz  = gets.chomp.to_i

puts 'год'
god = gets.chomp.to_i

if god % 400 == 0 || god % 4 == 0
  puts 'год високостный'
  kolih_dne = 0
  n = 0
  while n < mesiz - 1
    kolih_dne += hisla_mesiz[n]
    n += 1
  end
   if kolih_dne > 59
  	puts "Количество дней #{kolih_dne + 1}"
  else
  	puts "Количество дней #{kolih_dne}"
  end
else
  puts 'год не високостный'
  kolih_dne = 0
  n = 0
  while n < mesiz - 1
    kolih_dne += hisla_mesiz[n]
    n += 1
  end
  puts "Количество дней #{kolih_dne}"
end




