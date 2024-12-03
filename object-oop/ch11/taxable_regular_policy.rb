class TaxableRegularPolicy < RegularPolicy
  attr_reader :tax_rate

  include TaxablePolicy

  def initialize(amount, seconds, tax_rate)
    super(amount, seconds)
    @tax_rate = tax_rate
  end
end
