class Main
  
  def initialize
    @stations = []
    @wagon = []
    @trains = []
    @routes = []
  end

  def run
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
      puts "10 - Просмотреть список станций"
      puts "11 - Переместить поезд назад"
      puts "12 - Назначить поезду маршрут"
      puts "13 - Посмотреть маршрут"
      puts "14 - exit"
      print "Введите номер выбранного пункта: "
      @choice = gets.to_i
      break if choice == 14
      nomber_vod
    end
  end

  private

  attr_accessor :choice

  def nomber_vod
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
      rout_train
    when 13
      print_routes
    end
  end

  def ol_station
    loop do
      puts "ведите имя станций с первой по последнюю и стоп для окончания"
      name = gets.chomp
      break if name == 'стоп' || name == 'c'
        station = Station.new(name)
        @stations << station
    end
  end

  def add_station
    if @stations.size >= 1
      puts "Введите имя станции: "
      name = gets.chomp
      station = Station.new(name)
      @stations << station
    end
  end  

  def delete_st
    if @stations.size >= 1
      @stations.pop
    end
  end  

  def add_train
    puts "Выбирите тип поезда( 1 или 2 )."
    puts "1-Пассажирский"
    puts "2-грузавой"
    type = gets.to_i
    puts "Ведите его номер."
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
    end
  end

  def list_train
    @trains.each_with_index do |train, number| 
      puts "#{number} - #{@train.number}" 
    end
  end

  def take_train
    list_train
    print "Введите номер поезда: "
    gets.to_i
  end

  def add_wagon
    train = @trains[take_train]
    if train.type == 'passenger'
      train.add_wagon(WagonPassenger.new)
    elsif train.type == 'cargo'
      train.add_wagon(WagonCargo.new)
    end
  end  

  def remove_carrige
    train = @trains[take_train]
    train.delete_wagon if train
  end

  def new_route
    if @stations.size >= 1
      list_station
      print "Введите  номер первой станции маршрута "
      from = gets.to_i
      print "Введите номер последней станции  маршрута "
      to = gets.to_i


      route = Route.new(@stations[from], @stations[to])
      @routes << route
      puts "#{@routes}"
    else
      puts "Нет станций"
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


  def print_routes
    @routes.each_with_index do |val, index| 
      puts "#{index} - #{val.name}"
    end
  end
  
  def rout_train
    print_routes
    puts "Введите номер маршрута"
    route = gets.to_i
    train = take_train
    unless train.nil? && @routes[route]   
      @trains[train].set_route(@routes[route])
    else
      puts "Неправельный ввод"
    end 
  end                                    
end