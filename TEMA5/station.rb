class Station
  include InstanceCounter

  attr_reader :name

  @@stations = []

  def self.all
    @@stations
  end

  instances

  def initialize(name)
    @name = name
    @trains = []
    @@stations << self
    register_instance
    puts "Сегодня была открыта станция #{name}"
  end

  def get_train(train)
    @trains << train
    train.station = self
    puts "Поезд  #{train.number} на станции - #{@name}"
  end
end


