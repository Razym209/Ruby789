class Route
  attr_reader :item
  
  def initialize(start_station, finish_station)
    @item = [start_station, finish_station]
  end

  def add_stantion(item)
  	@item.insert(-2, station)
  end

  def del_stantion(item)
    @item.delete(station)
  end

  def list_p
    @item.each {|station| puts station }
  end
end
