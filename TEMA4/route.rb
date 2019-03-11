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

  def add(station)
    @stations.insert(-2, station)
  end

  def delete(station)
    @stations.delete(station)
  end

  def list
    puts @stations
  end
end
