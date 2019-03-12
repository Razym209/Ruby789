class Train
  attr_accessor :speed, :wagon, :type, :route, :station
  def initialize(number, type)
    @type = type
    @number = number
    @speed = 0
    @wagon = []
  end

  def type
    puts "Поезд №#{@number} типа #{@type}"
  end

  def speed_up(speed) # ускорение
    @speed  += speed
  end

  def braking(speed) # замедление
    @speed -= speed if @speed > 0 
  end

  def stop # стоп
    @speed = 0
  end

  def route=(route) # возрат к началу
    @route = route
    @current_station = 0
    @route.stations[@current_station].add_train(self)
  end


  def add_wagon(wagon)
    @wagon << wagon.list
    puts "К поезду №#{@number} добавлен вагон №#{wagon.list}, теперь у него вагонов #{@wagon.size} шт."
  end


  def list_wagon
    puts "У поезда сейчас #{@wagon.size} вагонов."
    puts "К поезду присоединены вагоны #{@wagon}"
  end

  def delete_wagon
    if speed_zero?
      @wagon.pop
      puts "вагон отцеплен"
    else
      puts "невозможно отцепить вагон во время движжения поеза "
    end
  end

  def take_route(station)
    @station = station
      puts "Поезд №#{@number} готов ехать с станции #{@station.first} на станцию #{@station.last}"
  end

    def move(station)
      if @route.include?(station)
        @station = station
        puts "Поезд №#{@number} приехал на с станцию #{@station}"
      else
        puts "Такой станции нет в маршруте"
      end
    end

    def list
       {@number => @type}
    end

  def move_go # движение вперед
    station_index = @route.stations.index(@current_station)
    @current_station = @route.stations[station_index + 1]
    @current_station.get_train(self)
  end

  def move_back # движение назад
    station_index = @route.stations.index(@current_station)
    @current_station = @route.stations[station_index - 1]
    @current_station.get_train(self)  
  end

private

  def speed_zero?
    @speed.zero?
  end

  def count_hash_dublicate(hash, value)
    count = 0
    hash.values.each do |t|
      if t == value
        count += 1
      end
    end
    return count
  end

  def wagon_such_train?
  end

end
