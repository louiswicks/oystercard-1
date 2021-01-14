class Journey
  MINIMUM_FARE = 1
  PENALTY_FARE = 6
  attr_reader :entry_station, :exit_station, :fare

  def initialize(station = nil)
    @entry_station = station
  end

  def fare
    @entry_station && @exit_station ? MINIMUM_FARE : PENALTY_FARE
  end

  def finish(station)
    @exit_station = station
    self
  end

  def complete?
    !!@entry_station
  end

end
