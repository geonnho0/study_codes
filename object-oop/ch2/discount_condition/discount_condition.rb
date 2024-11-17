class DiscountCondition
  def satisfied_by?(screening)
    raise NotImplementedError
  end
end
