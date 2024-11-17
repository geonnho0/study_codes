class Audience
  def initialize(bag)
    @bag = bag
  end

  def buy(ticket)
    if bag.invitation?
      bag.ticket = ticket
      return 0
    end
    bag.ticket = ticket
    bag.minus_amount(ticket.fee)
    ticket.fee
  end
end
