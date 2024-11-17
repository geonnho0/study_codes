class DiscountPolicy
  def initialize(*conditions)
    @conditions = conditions
  end

  def calculate_discount_amount(screening)
    @conditions.each do |condition|
      return discount_amount(screening) if condition.satisfied_by?(screening)
    end

    Money.zero
  end

  protected

  def discount_amount(screening)
    raise NotImplementedError
  end
end
