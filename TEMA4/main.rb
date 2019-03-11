require_relative "./train.rb"
require_relative "./train_cargo.rb"
require_relative "./train_passenger.rb"
require_relative "./station.rb"
require_relative "./route.rb"
require_relative "./wagon.rb"
require_relative "./wagon_cargo.rb"
require_relative "./wagon_passenger.rb"

@stations = []
@wagon = []
@trains = []
@routes = []

def ol_station
  loop do
    puts "ведите имя станций с первой по последнюю и стоп для окончания"
    name = gets.chomp
    station = Station.new(name)
    @stations << station
  break if name == 'стоп'
  end
  @stations.delete('стоп') #или @stations.pop
end

def add_station
  if @stations.size >= 1
    station = gets.chomp
    @stations << station
  end
end  
def delete_st
  if @stations.size >= 1
    @stations.delete_at(-1) #или @stations.pop
  end
end  

def add_train
  puts "Выбирите тип поезда( 1 или 2 ) и ведите его номер."
  puts "1-Пассажирский"
  puts "2-грузавой"
  type = gets.to_i
  number = gets.to_i
  case type
    when 1 
      @trains << TrainPassenger.new(number)
    when 2
      @trains << TrainCargo.new(number)
  end
end

def list_station
  @stations.each_with_index do |val, index| 
    puts "#{index} - #{val.name}"
    val.show_trains
  end
end


def list_train
     @trains.each_with_index do |type, number| 
    puts "#{type} - #{number}"
  end
end

def add_st(station)
    @stations.insert(-2, station)
end


def take_train
  if @trains.size >= 0
    list_train
    print "Введите номер поезда: "
    gets.to_i
  else
    nil
  end
end

def add_wagon
  train = @trains[take_train]

  if train && train.type == 'passenger'
    train.add_wagon(WagonPassenger.new)
  else train && train.type == 'cargo'
    train.add_wagon(WagonCargo.new)
  end
end

def remove_carrige
  train = @trains[take_train]
  if train
    train.delete_wagon
  end
end

def new_route
  if @stations.size >= 1
    list_station
    print "Введите имя маршрута "
    name = gets.chomp
    print "Введите  номер первой станции маршрута "
    a = gets.to_i
    print "Введите номер последней станции  маршрута "
    b = gets.to_i
    if @stations[a] && @stations[b]
      route = Route.new(name, @stations[a], @stations[b])
      @routes << route
      puts @routes
    else
      puts "нет таких станций"
    end
  else
    puts "нет станций"
  end
end

def go_train
  train = take_train
    @trains[train].move_go
end

def back_train
  train = take_train
  @trains[train].move_back
end

loop do
  puts "1 - Создать станцию"
  puts "2 - Создать поезд"
  puts "3 - Создать маршрут"
  puts "4 - Добавить станцию"
  puts "5 - Удалить станцию"
  puts "6 - Переместить поезд вперед"
  puts "7 - Добавить вагоны к поезду"
  puts "8 - Отцепить вагоны от поезда"
  puts "9 - Просмотреть тип поездов"
  puts "10 -Просмотреть список станций"
  puts "11 - Переместить поезд назад"
  puts "12 - exit"
  print "Введите номер выбранного пункта: "
  choice = gets.to_i
  case choice
    when 1
      ol_station
    when 2
      add_train
    when 3
      new_route
    when 4
      add_station
    when 5
      delete_st
    when 6
      go_train
    when 7
      add_wagon
    when 8
      remove_carrige
    when 9
      list_train
    when 10
      list_station
    when 11
    back_train
    when 12
      break
    else
      puts "выбранного пункта нет"
  end
end
