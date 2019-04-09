class Route
  include InstanceCounter

  attr_reader :stations, :speed, :wagon, :station, :name, :type, :route

  def initialize(from, to)
    @stations = [from, to]
    @name = "#{from.name} - #{to.name}"
    @from = from
    @to = to
    validate!
    register_instance
  end

  def add(station)
    @stations.push(station)
  end

  def delete(station)
    @stations.delete(station)
  end

  def valid?
    validate!
    true
  rescue StandardError
    false
  end

  protected

  def validate!
    raise 'Движение невозможно. Ехать некуда!' if @stations.size < 2
    raise 'Станции одинаковы' if @from == @to
    raise 'Ошибка' unless @stations.all? { |station| station.is_a?(Station) }
  end
end
