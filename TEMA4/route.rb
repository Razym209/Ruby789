class Route
  attr_reader :stations, :speed, :wagon, :station, :number, :type, :route

  def initialize(from, to)
    @stations = [from, to]
  end

  def add(station)
    @stations.push(station)
    puts "Станция #{station.name} добавлена"
  end

def delete(station)
    puts "Станция #{station.name} удалена"
    @stations.delete(station)
  end

  def list
    puts @stations
  end
end
