class Wagon
  include Manufacturer

attr_reader :type

  def initialize(number, type)
    @type = type
    @number = number
    #puts "Создан вагон №#{@number} типа #{@type}"
  end
end
