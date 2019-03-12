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
      puts "10 -Просмотреть список станций"
      puts "11 - Переместить поезд назад"
      puts "12 - exit"
      print "Введите номер выбранного пункта: "
      @choice = gets.to_i
      break if choice == 12
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
    end
  end

  def ol_station
  loop do
    puts "ведите имя станций с первой по последнюю и стоп для окончания"
    name = gets.chomp
    break if name == 'стоп'
    station = Station.new(name)
    @stations << station
    end
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
      val.show_trains
    end
  end

  def list_train
    @trains.each_with_index do |type, number| 
    puts "#{number} - #{@trains} - #{@number}" # Так он выводит плный список, мне это и надо.
    end
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
        puts "#{@routes}"
      else
        puts "Неверно введены станции"
      end
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
end
