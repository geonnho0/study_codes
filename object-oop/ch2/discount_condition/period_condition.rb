class PeriodCondition < DiscountCondition
  def initialize(day_of_week, start_time, end_time)
    @day_of_week = day_of_week
    @start_time = start_time
    @end_time = end_time
  end

  def satisfied_by?(screening)
    screening.start_time.day_of_week == @day_of_week &&
      @start_time <= screening.start_time &&
      screening.start_time < @end_time
  end
end
