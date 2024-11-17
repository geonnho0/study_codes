class Money
  attr_reader :amount

  class << self
    def zero
      @@zero ||= Money.wons(0)
    end
  end

  def initialize(amount)
    @amount = amount
  end

  def self.wons(amount)
    Money.new(amount)
  end

  def plus(amount)
    Money.new(@amount + amount.amount)
  end

  def minus(amount)
    Money.new(@amount - amount.amount)
  end

  def times(percent)
    Money.new(@amount * percent)
  end

  def less_than?(other)
    @amount < other.amount
  end

  def greater_than_or_equal?(other)
    @amount >= other.amount
  end
end
