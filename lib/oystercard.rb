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
    raise "Insufficient funds" if balance < MINIMUM_BALANCE
    if @journey != nil
      deduct(@journey.fare)
      @journey = nil
      touch_in(station)
    else
      @journey = Journey.new(station)
    end
  end

  def touch_out(station)
    if @journey == nil
      @journey = Journey.new
      @journeys << @journey.finish(station)
    else
      @journeys << @journey.finish(station)
    end
    deduct(@journey.fare)
  end

private #----------------------------

  def deduct(amount)
    @balance -= amount
  end

end
