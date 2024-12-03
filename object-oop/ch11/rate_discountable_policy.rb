module RateDiscountablePolicy
  def discount_amount
    raise NotImplementedError
  end

  def calculate_fee(phone)
    super
    # puts "RateDiscountablePolicy#calculate_fee"
    fee = super
    fee - discount_amount
  end
end
