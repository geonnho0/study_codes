class Movie
  attr_reader :fee

  def initialize(title, running_time, fee, discount_policy)
    @title = title
    @running_time = running_time
    @fee = fee
    @discount_policy = discount_policy
  end

  def calculate_movie_fee(screening)
    @fee.minus(@discount_policy.calculate_discount_amount(screening))
  end
end
