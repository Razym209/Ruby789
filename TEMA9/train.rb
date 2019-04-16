require_relative 'manufacturer'
require_relative 'instance_counter'
require_relative 'validation'

class Train
  include Manufacturer
  include InstanceCounter
  include Validation

  attr_accessor :speed, :wagon, :station, :number, :type

  validate :number, :presence
  validate :number, :type, String
  validate :number, :format, /^[\w\d]{3}-?[\w\d]{2}$/

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
    validate!
    register_instance
  end

  def speed_up(speed)
    @speed += speed
  end

  def braking(speed)
    @speed -= speed if @speed > 0
  end

  def stop
    @speed.zero?
  end

  def route(route)
    @route = route
    @current_station = @route.stations.first
    @current_station.get_train(self)
  end

  def add_wagon(wagon)
    wagon.number = @wagon.size + 1 if speed.zero? && wagon.type == type
    @wagon << wagon
  end

  def delete_wagon
    if @speed.zero?
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

  def each_wagon
    @wagon.each_with_index { |wagon, index| yield wagon, index }
  end
end
