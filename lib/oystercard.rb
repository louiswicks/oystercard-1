require_relative 'station'
class OysterCard

  MAXIMUM_BALANCE = 90
  MINIMUM_BALANCE = 1
  attr_reader :balance, :entry_station, :exit_station, :journeys

  def initialize
    @balance = 0
    @journeys = Array.new
  end

  def top_up(amount)
    fail "Unable to top up as it would exceed balance limit (£#{MAXIMUM_BALANCE})" if (self.balance + amount) > MAXIMUM_BALANCE
    self.balance += amount
  end

  def touch_in(station)
    @journey = Hash.new
    raise "Insufficient funds" if balance < MINIMUM_BALANCE
    self.in_use = true
    self.entry_station = station
    @journey[:entry_station] = entry_station
  end

  def touch_out(station)
    self.exit_station = station
    self.in_use = false
    deduct(MINIMUM_BALANCE)
    @journey[:exit_station] = exit_station
    @journeys << @journey
  end

  def in_journey?
    !!in_use
  end


private #-----------------------------

  attr_writer :balance, :entry_station, :exit_station
  attr_accessor :in_use

  def deduct(amount)
    self.balance -= amount
  end

end
