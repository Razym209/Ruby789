class WagonCargo < Wagon
  attr_reader :free_volume, :volume

  def initialize(volume, number)
    super('Cargo', number)
    @free_volume = volume
    @volume = 0
    validate!
  end

  def add_volume(volume)
    if (@volume + volume) < @free_volume
      @volume += volume
    else
      nil
    end
  end

  def valid?
    validate!
    true
  rescue StandardError
    false
  end

  protected

  def validate!
    raise 'Объем поезда должен быть числом' unless @free_volume.is_a? Integer
    raise 'Объем поезда не может быть отрицательным' if @free_volume < 0
  end
end
