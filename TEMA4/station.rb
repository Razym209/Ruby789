class Station
 attr_reader :name
  
  def initialize(name)
    @name = name
    @trains = []
  end

  def list
    puts "На станции сейчас #{@trains.length} поездов"
  end

  def list_type
    puts "На станции поездов типа Freight: #{count_hash_dublicate(@trains, "freight")}"
    puts "На станции поездов типа Passenger: #{count_hash_dublicate(@trains, "passenger")}"
  end

  def take_train(train = {})
    @number = train.keys.join
    @type   = train.values.join
    if @number.nil? || @type.nil?
      puts "Невозможно"
    else

      @trains[@number] = @type
      puts "Поезд #{@number} и типом #{@type} на станции"
    end
  end

  def send_train(train = {})
    @number = train.keys.join
    @type   = train.values.join
    if @trains.include?({@number => @type})
      @trains.delete({@number => @type})
      puts "Поезд #{@number} покинул станцию"
    else
      puts "нет такого поезда"
    end
  end

def show_trains
    @trains.each {|train| puts "On station - #{@name} train - #{train.number}"}
  end
end


