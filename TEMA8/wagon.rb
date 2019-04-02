class Wagon
  include Manufacturer

attr_reader :type
attr_accessor :number

  def initialize(_extra)
    @number = false
  end
end
