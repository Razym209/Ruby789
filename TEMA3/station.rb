class Station
  attr_reader :name, :trains
  
  def initialize(name)
    @name = name
    @trains = []
  end

  def accept(train)
    @trains << train
  end
  
  def list_p
    @trains.each { |train| puts train }
  end
  
  def list_t(type)
    @trains.select { |train| train.type == type }
  end
  
  def del(train)
    @trains.delete(train)
  end
end
