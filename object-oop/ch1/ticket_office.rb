class TicketOffice
  attr_reader :amount

  def initialize(amount, *tickets)
    @amount = amount
    @tickets = tickets
  end

  def sell_ticket_to(audience)
    plus_amount(audience.buy(ticket))
  end

  private

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
