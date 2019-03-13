class Station
  attr_reader :name
  
  def initialize(name)
    @name = name
    @trains = []
  end


  def get_train(train)
    @trains << train
    train.current_station = self
    
  end

  def send_train(train)
    @trains.delete(train)
    train.current_station = nil
  end
end
  
