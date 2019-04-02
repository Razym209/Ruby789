require_relative 'manufacturer'
require_relative 'instance_counter'

class Train
  include Manufacturer
  include InstanceCounter

  attr_accessor :speed, :wagon, :station, :number, :type, :route

  FORMAT_WAGON = /^[\w\d]{3}-?[\w\d]{2}$/.freeze

@@trains = {}

def self.find(number)
    @@trains[number]
  end

  def initialize(number, type)
    @type = type
    @number = number.to_s
    @speed = 0
    @wagon = []
    @@trains[@number] = self
    register_instance
  end

  def valid?
    validate!
    true
  rescue StandardError
    false
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
    else
      false
    end
  end

  def move_go
    station_index = @route.stations.index(@station)
    @station = @route.stations[station_index + 1]
    @station.get_train(self)
  end

  def move_back
    station_index = @route.stations.index(@station)
    @station = @route.stations[station_index - 1]
    @station.get_train(self)
  end

  def each_carriage(&block)
    if block.arity == 2
      @wagon.each_with_index { |wagon, index| yield index, wagon }
    else
      @wagon.each { |wagon| yield wagon }
    end
  end

  protected

  def validate!
    raise 'Номер поезда может быть только строкой' unless @number.is_a? String
    raise 'Номер поезда должен быть задан' if @number.empty?
    if @number !~ FORMAT_WAGON
      raise 'Номер поезда должен быть в формате ***-**'
    end
  end
end
