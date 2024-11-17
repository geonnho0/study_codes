class TicketSeller
  def initialize(ticket_office)
    @ticket_office = ticket_office
  end

  def sell_to(audience)
    if audience.bag.invitation?
      ticket = ticket_office.ticket
      audience.bag.ticket = ticket
    else
      ticket = ticket_office.ticket
      audience.bag.minus_amount(ticket.fee)
      @ticket_office.plus_amount(ticket.fee)
      audience.bag.ticket = ticket
    end
  end
end
