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

  def acceleration(speed) # ускорение
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
    if wagon_such_train?(wagon) && speed_zero?
      @wagon << wagon.list
      puts "К грузовому поезду №#{@number} добавлен грузовой вагон №#{wagon.list}, теперь у него вагонов #{@wagon.size} шт."
    elsif !wagon_such_train?(wagon) && !speed_zero?
      puts "Нужно остановите поезд"
    elsif !wagon_such_train?(wagon)
      puts "Вы не можете присоединить вагон"
    end
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
    return {@number => @type}
  end




private
# Методы вынесены потому что они не используются клиентским кодом, а только другими методами.

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
