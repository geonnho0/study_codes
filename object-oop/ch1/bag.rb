class Bag
  attr_reader :amount, :invitation

  def initialize(amount, invitation = nil)
    @ticket = nil
    @amount = amount
    @invitation = invitation
  end

  def hold(ticket)
    @ticket = ticket
    return 0 if invitation?

    minus_amount(ticket.fee)
    ticket.fee
  end

  private

  def invitation?
    invitation.present?
  end

  def ticket?
    @ticket.present?
  end

  def minus_amount(amount)
    @amount -= amount
  end

  def plus_amount(amount)
    @amount += amount
  end
end
