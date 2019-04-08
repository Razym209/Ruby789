class WagonPassenger < Wagon
  attr_reader :seats, :taken_seats

  def initialize(seats, number)
    super('Passenger', number)
    @seats = seats
    @taken_seats = 0
    validate!
  end

  def add_passenger
    @taken_seats += 1 if @taken_seats < @seats
  end

  def valid?
    validate!
    true
  rescue StandardError
    false
  end

  protected

  def validate!
    raise 'Число мест должно быть числом' unless @seats.is_a? Integer
    raise 'Неверное кол-во свободных мест' if @seats < 0
    raise 'Неверное кол-во занятых мест' if @taken_seats < 0
  end
end
