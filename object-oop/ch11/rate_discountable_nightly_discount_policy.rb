class RateDiscountableNightlyDiscountPolicy < NightlyDiscountPolicy
  attr_reader :discount_amount

  include RateDiscountablePolicy

  def initialize(nightly_amount, regular_amount, discount_amount)
    super(nightly_amount, regular_amount)
    @discount_amount = discount_amount
  end
end
