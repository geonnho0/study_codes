class Theater
  def initialize(ticket_seller)
    @ticket_seller = ticket_seller
  end
  
  def enter(audience)
    if audience.bag.invitation?
      ticket = @ticket_seller.ticket_office.ticket
      audience.bag.ticket = ticket
    else
      ticket = @ticket_seller.ticket_office.ticket
      audience.bag.minus_amount(ticket.fee)
      @ticket_seller.ticket_office.plus_amount(ticket.fee)
      audience.bag.ticket = ticket
    end
  end
end
