class OysterCard

  MAXIMUM_BALANCE = 90
  MINIMUM_BALANCE = 1
  attr_reader :balance, :entry_station

  def initialize
    @balance = 0
  end

  def top_up(amount)
    fail "Unable to top up as it would exceed balance limit (£#{MAXIMUM_BALANCE})" if (self.balance + amount) > MAXIMUM_BALANCE
    self.balance += amount
  end

  def touch_in(station)
    raise "Insufficient funds" if balance < MINIMUM_BALANCE
    self.in_use = true
    self.entry_station = station
  end

  def touch_out
    self.in_use = false
    deduct(MINIMUM_BALANCE)
  end

  def in_journey?
    !!in_use
  end


private #-----------------------------

  attr_writer :balance, :entry_station
  attr_accessor :in_use

  def deduct(amount)
    self.balance -= amount
  end

end
