require_relative 'station'
require_relative 'journey'

class OysterCard

  MAXIMUM_BALANCE = 90
  MINIMUM_BALANCE = 1
  attr_reader :balance, :journeys, :journey

  def initialize
    @balance = 0
    @journeys = Array.new
  end

  def top_up(amount)
    fail "Unable to top up as it would exceed balance limit (£#{MAXIMUM_BALANCE})" if (self.balance + amount) > MAXIMUM_BALANCE
    @balance += amount
  end

  def touch_in(station)
    touch_out(nil) if @journey != nil
    raise "Insufficient funds" if balance < MINIMUM_BALANCE
    @journey = Journey.new(station)
  end

  def touch_out(station)
    @journey = Journey.new if @journey == nil
    @journeys << @journey.finish(station)
    complete_journey
  end

  def complete_journey
    deduct(@journey.fare)
    @journey == nil
  end

private #----------------------------

  def deduct(amount)
    @balance -= amount
  end

end
