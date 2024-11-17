class Theater
  def initialize(ticket_seller)
    @ticket_seller = ticket_seller
  end

  def enter(audience)
    @ticket_seller.sell_to(audience)
  end
end
