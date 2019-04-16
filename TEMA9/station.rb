class Station
  include InstanceCounter

  attr_reader :name
  @@stations = []

  instances

  def initialize(name)
    @name = name.to_s
    @trains = []
    validate!
    @@stations << self
    register_instance
  end

  def self.all
    @@stations
  end

  def valid?
    validate!
    true
  rescue StandardError
    false
  end

  def get_train(train)
    @trains << train
    train.station = self
  end

  def each_train
    @trains.each_with_index { |train, index| yield train, index }
  end

  def validate!
    raise 'Станция должно состоять из более 2 символов' if @name.size < 3
  end
end
