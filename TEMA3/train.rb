class Train
  attr_reader :number, :type, :sum, :speed, :c_station, :route

  def initialize(namber, type, sum)
    @number = namber
    @type = type
    @sum = sum
    @speed = 0
  end
  
  def acceleration(speed)
  	@speed  += speed
  end

  def braking(speed)
    @speed -= speed
  end

  def stop
    @speed = 0
  end

  def sum_addition
    @sum += 1 if speed == 0 && @sum >= 0
  end
 
  def sum_addition
    @sum -= 1 if speed == 0 && @sum != 0
  end

  def route=(route)
    @route = route
    @c_station = 0
    @route.item[@c_station].add_train(self)
  end

  def next_station
    @route.item[@c_stantion + 1]
  end

  def previous_station
    @route.item[@c_stantion - 1]
  end

  def station_next
    if next_station
      c_station.send_train(self)
      @c_station += 1
      c_station.add_train(self)
    end
  end 
  
  def station_pregoing
    if previous_station
      c_station.send_train(self)
      @c_station -= 1
      c_station.add_train(self)
    end
  end

  def station_c
    @route.item[@c_station]
  end
end
