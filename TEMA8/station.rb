class Station
  include InstanceCounter

  attr_reader :name

  @@stations = []

  def self.all
    @@stations
  end

  instances

  def initialize(name)
    @name = name.to_s
    @trains = []
    validate!
    @@stations << self
    register_instance
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

  def each_train(&block)
    if block.arity == 2
      @trains.each_with_index { |index, train| yield index, train }
    else
      @trains.each { |train| yield train }
    end
  end

  def validate!
    raise 'Станция должно состоять из более 2 символов' if @name.size < 3
  end
end

