
months_days = [31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31]

puts 'день'
day = gets.chomp.to_i

puts 'месяц'
month  = gets.chomp.to_i

puts 'год'
year = gets.chomp.to_i

if year % 4 == 0 && year % 100 != 0 || year % 400 == 0
  months_days[1] = 29
  puts 'год високостный'
else
  puts 'год не високостный'
end  
counter_days = 0
months_days.take(month - 1).each do |days|
  counter_days += days
end
puts "Количество дней #{counter_days}"
