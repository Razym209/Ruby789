class Train
  attr_accessor :speed, :wagon, :type, :station, :current_station
  attr_reader :route
  
  def initialize(number, type)
    @type = type
    @number = number
    @speed = 0
    @wagon = []
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

  def set_route(route) 
    route = route
    @current_station = @route.stations.first
    @current_station.get_train(self)
  end


  def add_wagon(wagon)
    @wagon << wagon.list
    puts "К поезду №#{@number} добавлен вагон №#{wagon.list}, теперь у  вагонов #{@wagon.size} шт."
  end

  def delete_wagon
    if speed_zero?
      @wagon.pop
      puts "вагон отцеплен"
    else
      puts "невозможно отцепить вагон во время движжения поеза "
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
end
