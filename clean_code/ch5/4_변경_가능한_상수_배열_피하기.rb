require 'minitest/autorun'

class ConstArrayTest < Minitest::Test
  def test_method1
    # 기본적으로 상수 배열은 변경이 가능하다
    # 이는 놀람 최소화 원칙을 위반한다
    array = [1, 2]
    array << 3
    assert_equal(array.size, 3)
  end

  def test_method2
    # 상수 배열을 변경하지 못하게 한다
    array = [1, 2].freeze
    assert_raises(FrozenError) { array << 3 }
  end
end

# 놀람 최소화 원칙 : 시스템은 사용자를 놀래키지 않고, 사용자 기대에 부합하는 방식으로 동작해야 한다
# 원칙을 따르면 시스템과 상호 작용할 때 쉽게 예측할 수 있다
