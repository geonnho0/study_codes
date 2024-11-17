class NoneDiscountPolicy < DiscountPolicy
  def discount_amount(_screening)
    Money.zero
  end
end
