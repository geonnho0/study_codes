require_relative 'regular_policy'
require_relative 'rate_discountable_policy'
require_relative 'taxable_policy'

class TaxableAndRateDiscountableRegularPolicy < RegularPolicy
  attr_reader :tax_rate, :discount_amount

  include RateDiscountablePolicy
  include TaxablePolicy

  def initialize(amount, seconds, discount_amount, tax_rate)
    super(amount, seconds)
    @tax_rate = tax_rate
    @discount_amount = discount_amount
  end
end
