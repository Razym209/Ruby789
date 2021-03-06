require_relative 'manufacturer'
require_relative 'instance_counter'
class Train
  include Manufacturer
  include InstanceCounter

  attr_accessor :speed, :wagon, :station, :number, :type, :route

@@trains = {}

def self.find(number)
    @@trains[number]
  end

  def initialize(number, type)
    @type = type
    @number = number
    @speed = 0
    @wagon = []
    @@trains[@number] = self
    register_instance
    puts "Сегодня был построен и выпущен поезд #{number}"
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

  def route(route)
    @route = route
    @current_station = @route.stations.first
    @current_station.get_train(self)
  end

  def add_wagon(wagon)
    @wagon << wagon if speed.zero? && type == wagon.type
  end


  def delete_wagon
    if @speed == 0
      @wagon.pop
      puts "вагон отцеплен"
    else
      puts "невозможно отцепить вагон во время движжения поеза "
    end
  end

  def move_go # движение вперед
    station_index = @route.stations.index(@station)
    @station = @route.stations[station_index + 1]
    @station.get_train(self)
  end

  def move_back # движение назад
    station_index = @route.stations.index(@station)
    @station = @route.stations[station_index - 1]
    @station.get_train(self)
  end

  private

  attr_writer :speed, :wagon, :station, :number, :type, :route
end
