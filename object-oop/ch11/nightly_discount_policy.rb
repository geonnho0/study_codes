class NightlyDiscountPolicy < BasicRatePolicy
  attr_reader :nightly_amount, :regular_amount, :seconds

  protected

  def calculate_call_fee(call)
    if call.from.hour >= 22
      nightly_amount * (call.duration.seconds / seconds.seconds)
    else
      regular_amount * (call.duration.seconds / seconds.seconds)
    end
  end
end
