module TaxablePolicy
  def tax_rate
    raise NotImplementedError
  end

  def calculate_fee(phone)
    super
    # puts "TaxablePolicy#calculate_fee"
    fee = super
    fee + fee * tax_rate
  end
end
