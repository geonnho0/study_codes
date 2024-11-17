class TicketSeller
  def initialize(ticket_office)
    @ticket_office = ticket_office
  end

  def sell_to(audience)
    @ticket_office.sell_ticket_to(audience)
  end
end
