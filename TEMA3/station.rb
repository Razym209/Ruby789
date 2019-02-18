class Station
  attr_reader :name, :composition
  
  def initialize(name)
    @name = name
    @composition = {}
  end

  def roster(train)
    @composition << train
  end
  
  def list_p
    @composition.each {|train| puts train }
  end
  
  def list_t(type)
    @composition.select {|train| train.type == type}
  end
  def del(type)
    @composition.delete(train)
  end
end
