require_relative 'regular_policy'
require_relative 'taxable_policy'
require_relative 'rate_discountable_policy'

class RateDiscountableAndTaxableRegularPolicy < RegularPolicy
  attr_reader :tax_rate, :discount_amount

  # 순서에 따라 실행 결과가 달라진다.
  include TaxablePolicy
  include RateDiscountablePolicy

  def initialize(amount, seconds, discount_amount, tax_rate)
    super(amount, seconds)
    @tax_rate = tax_rate
    @discount_amount = discount_amount
  end
end
