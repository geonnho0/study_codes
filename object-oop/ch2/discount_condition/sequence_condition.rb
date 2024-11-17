class SequenceCondition < DiscountCondition

  def initialize(sequence)
    super()
    @sequence = sequence
  end

  def satisfied_by?(screening)
    screening.sequence?(@sequence)
  end
end
