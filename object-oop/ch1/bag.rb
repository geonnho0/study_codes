class Bag
  attr_accessor :ticket
  attr_reader :amount, :invitation

  def initialize(amount, invitation = nil)
    @amount = amount
    @invitation = invitation
  end

  def invitation?
    invitation.present?
  end

  def ticket?
    ticket.present?
  end

  def minus_amount(amount)
    @amount -= amount
  end

  def plus_amount(amount)
    @amount += amount
  end
end
