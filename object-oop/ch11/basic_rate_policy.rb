class BasicRatePolicy
  def calculate_fee(phone)
    # puts "BasicRatePolicy#calculate_fee"
    phone.calls.map { |call| calculate_call_fee(call) }.reduce(0, :+)
  end

  protected

  def calculate_fall_fee(call)
    raise NotImplementedError
  end
end
