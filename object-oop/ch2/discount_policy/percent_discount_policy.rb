class PercentDiscountPolicy < DiscountPolicy
  def initialize(percent, *conditions)
    super(*conditions)
    @percent = percent
  end

  def discount_amount(screening)
    screening.movie_fee.times(@percent)
  end
end
