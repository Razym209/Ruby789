class Route
  attr_reader :stations
  
  def initialize(stations = [])
    if stations.size >= 2
      @stations = stations
      puts "Маршрут #{@stations.first} - #{@stations.last} создан"
    else
      puts "нужно больше станций"
    end
  end

  def add_station(station)
  	@stations.insert(-2, station)
  end

  def del_station(station)
    @stations.delete(station)
  end

  def list_puts
    puts @stations
  end
end

private
  # У меня нет идей какие методы можно внести сюда
end



