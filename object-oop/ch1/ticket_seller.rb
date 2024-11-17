class TicketSeller
  def initialize(ticket_office)
    @ticket_office = ticket_office
  end

  def sell_to(audience)
    ticket = ticket_office.ticket
    @ticket_office.plus_amount(audience.buy(ticket))
  end
end
