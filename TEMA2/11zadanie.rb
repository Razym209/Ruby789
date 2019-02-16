products = {}
sum = 0
final_sum = 0
loop do
  puts 'Наберите наименование товара или стоп для выхода' 
  name = gets.chomp
  break if name == 'стоп' || name == 'СТОП' 

  puts 'Наберите цену товара'
  price = gets.chomp.to_f

  puts 'Наберите количество товара'
  quantity = gets.chomp.to_f
  products[name]  = { price: price, quantity: quantity }
  
end
products.each do |name, has| 
  sum = has[:price] * has[:quantity]
  final_sum += sum
end
puts "Хэш #{products}"
puts "Конечная сумма = #{final_sum}"

