# null을 사용하여 다양한 조건(값이 없음, 정의되지 않은 값, 오류 등)을 나타낼 수 있음
# 이는 결합과 오류로 이어질 수 있다
# null 사용으로 인하여 여러 문제를 야기한다
# 1. 호출자와 발신자 간의 결합
# 2. 호출자와 발신자의 불일치
# 3. if, switch/case 오염
# 4. 실제 객체와 다형성을 제공하지 않기에 null 포인터 예외 발생
# 그리고 무엇보다, 현실 세계에 존재하지 않는 개념이다

class CartItem
  attr_reader :price

  def initialize(price)
    @price = price
  end
end

class DiscountCoupon
  attr_reader :rate

  def initialize(rate)
    @rate = rate
  end
end

class Cart
  def initialize(selected_items, discount_coupon)
    @items = selected_items
    @discount_coupon = discount_coupon
  end

  def total
    if @discount_coupon.nil?
      return subtotal
    end
    subtotal * (1 - @discount_coupon.rate)
  end

  private

  def subtotal
    @items.reduce(0) { |sum, item| sum + item.price }
  end
end

cart = Cart.new([
                  CartItem.new(1),
                  CartItem.new(2),
                  CartItem.new(7)
                ], DiscountCoupon.new(0.15))
puts cart.total # 10 - 1.5 = 8.5

cart = Cart.new([
                  CartItem.new(1),
                  CartItem.new(2),
                  CartItem.new(7)
                ], nil)
puts cart.total # 10 - nil = 10

puts '------'

# null 객체 패턴을 도입하여 if 문 검증을 피한다

class CarItem
  attr_reader :price

  def initialize(price)
    @price = price
  end
end

class DiscountCoupon
  attr_reader :rate

  def initialize(rate)
    @rate = rate
  end

  def discount(subtotal)
    subtotal * (1 - @rate)
  end
end

class NullCoupon
  def discount(subtotal)
    subtotal
  end
end

class Cart
  def total
    @discount_coupon.discount(subtotal)
  end
end

cart = Cart.new([
                  CartItem.new(1),
                  CartItem.new(2),
                  CartItem.new(7)
                ], NullCoupon.new)
puts cart.total # 10 - NullCoupon = 10
