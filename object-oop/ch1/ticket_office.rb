class TicketOffice
  attr_reader :amount

  def initialize(amount, *tickets)
    @amount = amount
    @tickets = tickets
  end

  def ticket
    @tickets.shift
  end

  def minus_amount(amount)
    @amount -= amount
  end

  def plus_amount(amount)
    @amount += amount
  end
end
