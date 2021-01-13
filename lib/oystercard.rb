class OysterCard

  MAXIMUM_BALANCE = 90
  MINIMUM_BALANCE = 1
  attr_reader :balance

  def initialize
    @balance = 0
    @in_use = false
  end

  def top_up(amount)
    fail "Unable to top up as it would exceed balance limit (£#{MAXIMUM_BALANCE})" if (self.balance + amount) > MAXIMUM_BALANCE
    self.balance += amount
  end

  def touch_in
    raise "Insufficient funds" if balance < MINIMUM_BALANCE
    self.in_use = true
  end

  def touch_out
    self.in_use = false
    deduct(MINIMUM_BALANCE)
  end

  def in_journey?
    in_use
  end


private #-----------------------------

  attr_writer :balance
  attr_accessor :in_use

  def deduct(amount)
    self.balance -= amount
  end

end
