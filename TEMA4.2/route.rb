class Route
  attr_reader :stations, :name
  
  def initialize(name, from, to)
    @stations = [from, to]
    @name = name
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
