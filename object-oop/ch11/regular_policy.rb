require_relative 'basic_rate_policy'

class RegularPolicy < BasicRatePolicy
  attr_reader :amount, :seconds

  def initialize(amount, seconds)
    @amount = amount
    @seconds = seconds
  end

  protected

  def calculate_call_fee(call)
    # puts "RegularPolicy#calculate_call_fee"
    amount * (call.duration.seconds / seconds.seconds)
  end
end
