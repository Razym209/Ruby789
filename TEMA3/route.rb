class Route
  attr_reader :stations
  
  def initialize(start_station, finish_station)
    @stations = [start_station, finish_station]
  end

  def add_station(station)
  	@stations.insert(-2, station)
  end

  def del_station(station)
    @stations.delete(station)
  end

  def list_p
    puts @stations
  end
end
