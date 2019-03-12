class Wagon

  def initialize(number, type)
    @number = number
    @type = type
    puts "Создан вагон №#{@number} типа #{@type}"
  end

  def type
    puts "Этот вагон №#{@number} типа #{@type}"
  end

  def list
    @number
  end
end
