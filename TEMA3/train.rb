class Train
  attr_reader :number, :type, :sum, :speed, :current_station, :route

  def initialize(number, type, sum)
    @number = number
    @type = type
    @sum = sum
    @speed = 0
  end
  
  def acceleration(speed)
  	@speed  += speed
  end

  def braking(speed)
    @speed -= speed if @speed > 0 
  end

  def stop
    @speed = 0
  end

  def sum_addition
    @sum += 1 if speed == 0
  end
 
  def sum_decrease
    @sum -= 1 if speed == 0 && @sum != 0
  end

  def route=(route)
    @route = route
    @current_station = 0
    @route.stations[@current_station].add_train(self)
  end

  def next_station
    @route.stations[@current_station + 1]
  end

  def previous_station
    @route.stations[@current_station - 1]
  end

  def station_next
    if next_station
      current_station.send_train(self)
      @current_station += 1
      current_station.add_train(self)
    end
  end 
  
  def station_pregoing
    if previous_station
      current_station.send_train(self)
      @current_station -= 1
      current_station.add_train(self)
    end
  end

  def station_worth
    @route.stations[@current_station]
  end
end
