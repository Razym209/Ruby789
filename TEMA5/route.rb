class Route
include InstanceCounter
attr_reader :stations, :speed, :wagon, :station, :name, :type, :route

  def initialize(from, to)
    @stations = [from, to]
    @name = "#{from.name} - #{to.name}" #без него лучше
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

  private

  attr_writer :stations, :name
end
