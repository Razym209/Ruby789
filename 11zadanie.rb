tovar = {}
summa = 0
koneh = 0
loop do
  puts 'Наберите наименование товара или стоп для выхода'
  imy = gets.chomp
break if imy == 'стоп' || imy == 'СТОП'

  puts 'Наберите цену товара'
  cena = gets.chomp.to_f

  puts 'Наберите количество товара'
  colih = gets.chomp.to_f

  summa = cena * colih
  tovar[imy]  = { cena => colih }
  koneh += summa
  puts "Хэш #{tovar}"
  puts "Сумма #{summa}"
  puts "Конечная сумма = #{koneh}"
end
