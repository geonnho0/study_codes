class AmountDiscountPolicy < DiscountPolicy
  def initialize(discount_amount, *conditions)
    super(*conditions)
    @discount_amount = discount_amount
  end

  def discount_amount(_screening)
    @discount_amount
  end
end
