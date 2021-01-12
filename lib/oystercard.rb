class Oystercard

  MAXIMUM_BALANCE = 90
  attr_reader :balance

  def initialize
    @balance = 0
    @in_use = false
  end

  def top_up(amount)
    fail "Unable to top up as it would exceed balance limit (£#{MAXIMUM_BALANCE})" if (self.balance + amount) > MAXIMUM_BALANCE

    self.balance += amount
  end

  def deduct(amount)
    self.balance -= amount
  end

  def touch_in
    fail "Insufficient funds" if balance < 1
    self.in_use = true
  end

  def touch_out
    self.in_use = false
  end

  def in_journey?
    in_use
  end


private #-----------------------------

  attr_writer :balance
  attr_accessor :in_use


end
