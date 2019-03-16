class Station
  attr_reader :name

  def initialize(name)
    @name = name
    @trains = []
  end


  def get_train(train)
    @trains << train
    train.station = self
    puts "Поезд  #{train.number} на станции - #{@name}"
  end
end


