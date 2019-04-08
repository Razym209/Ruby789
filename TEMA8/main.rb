class Main
attr_accessor :number, :type
  def initialize
    @stations = []
    @wagon = []
    @trains = []
    @routes = []
  end

  def run
    loop do
      puts '1 - Создать станцию'
      puts '2 - Создать поезд'
      puts '3 - Создать маршрут'
      puts '4 - Добавить станцию к маршруту'
      puts '5 - Удалить станцию из маршрута'
      puts '6 - Переместить поезд вперед'
      puts '7 - Добавить вагоны к поезду'
      puts '8 - Отцепить вагоны от поезда'
      puts '9 - Просмотреть список поездов'
      puts '10 - Просмотреть список станций'
      puts '11 - Переместить поезд назад'
      puts '12 - Назначить поезду маршрут'
      puts '13 - Посмотреть маршрут'
      puts '14 - Показать вагоны в поезде'
      puts '15 - Добавить пассажира'
      puts '16 - Добавить вес'
      puts '17 - exit'
      print 'Введите номер выбранного пункта: '
      @choice = gets.to_i
      break if choice == 17
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
      add_station_route
    when 5
      delete_station_route
    when 6
      go_train
    when 7
      add_wagon
    when 8
      delit_wagon
    when 9
      list_train
    when 10
      list_station
    when 11
      back_train
    when 12
      rout_train
    when 13
      list_routes
    when 14
      show_wagon_in_train
    when 15
      add_passenger_wagon
    when 16
      add_cargo_wagon
    end
  end

  def ol_station
    loop do
      puts 'ведите имя станций с первой по последнюю и стоп для окончания'
      name = gets.chomp
      break if name == 'стоп'
      station = Station.new(name)
      @stations << station
    end
  rescue StandardError => e
    puts e.message
    retry
  end

  def add_station_route
    list_routes
    puts 'Введите порядковый номер маршрута'
    v_route = gets.to_i
    list_station
    puts 'Ведите номер станции которую хотите добавить'
    no_station = gets.to_i
    @routes[v_route].add(@stations[no_station])
  end

  def delete_station_route
    list_routes
    puts 'Введите порядковый номер маршрута'
    v_route = gets.to_i
    list_station
    puts 'Ведите номер станции которую хотите удалить'
    no_station = gets.to_i
    @routes[v_route].delete(@stations[no_station])
  end

  def add_train
    puts 'Выбирите тип поезда( 1 или 2 ).'
    puts '1-Пассажирский'
    puts '2-грузавой'
    ty = gets.to_i
    puts 'Ведите его номер.'
    number = gets.to_i
    case ty
    when 1
      @trains << TrainPassenger.new(number)
    when 2
      @trains << TrainCargo.new(number)
    end
  end

  def list_station
    @stations.each_with_index do |val, index|
      puts "#{index} - #{val.name}"
      #puts @stations puts"#{@stations}"
    end
  end

  def list_train
    @trains.each_with_index do |train, number|
      puts "#{number} - #{train.number}"
      #puts @trains puts"#{@trains}"
    end
  end

  def list_routes
    @routes.each_with_index do |val, index|
    puts "#{index} - #{val.name}"
    #puts @routes puts"#{@routes}"
    end
  end

  def take_route
    list_train
    print 'Введите номер поезда: '
    gets.to_i
  end

  def take_train
    list_train
    print 'Введите номер поезда: '
    gets.to_i
  end

  ERROR = 'Что то пошло не по плану'.freeze

  def add_wagon
    train = @trains[take_train]
    if train && train.type == 'Passenger'
      print 'Введите количество мест '
      seats = gets.to_i
      number = train.wagon.size + 1
      train.add_carrige(WagonPassenger.new(seats, number))
    elsif train && train.type == 'Cargo'
      print 'Введите объем - '
      volume = gets.to_i
      number = train.wagon.size + 1
      train.add_carrige(WagonCargo.new(volume, number))
    else
      puts 'Нет поездов'
    end
    rescue StandardError => e
    puts e.message
  end

  def new_route
    if @stations.size >= 1
      list_station
      puts 'Введите  номер первой станции маршрута '
      from = gets.to_i
      puts 'Введите номер последней станции  маршрута '
      to = gets.to_i
      route = Route.new(@stations[from], @stations[to])
      @routes << route
      list_routes
    else
      puts 'Нет станций'
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

  def rout_train
    list_routes
    puts 'Введите номер маршрута'
    route = gets.to_i
    list_train
    puts 'Введите номер поезда: '
    train = gets.to_i
    unless train.nil? && @routes[route]
      @trains[train].route(@routes[route])
    else
      puts 'Неправельный ввод'
    end
  end

  def delit_wagon
    train = @trains[take_train]
    train.delete_wagon if train
  end

  def show_wagon_in_train
    train =  take_train
    if train.type == 'Cargo'
      train.each_wagon do |i, c|
        puts "#{i}: Грузовой #{c.free_volume}/#{c.taken_volume}"
      end
    else
      train.each_wagon do |i, c|
        puts "#{i}: Пассажирский #{c.free_seats}/#{c.taken_seats}"
      end
    end
  end

  def add_passenger_wagon
    train = take_train('Passenger')
    train = @trains[train]
    show_wagon_in_train(train)
    print 'Ведите номер вагона  - '
    wagon = gets.to_i
    train.wagon[wagon].add_passenger
  end

  def add_cargo_wagon
    train = take_train('Cargo')
    train = @trains[train]
    show_wagon_in_train(train)
    print 'Ведите номер вагона - '
    wagon = gets.to_i
    print 'Введите вес -'
    volume = gets.to_i
    train.wagon[wagon].add_volume(volume)
  end
end
