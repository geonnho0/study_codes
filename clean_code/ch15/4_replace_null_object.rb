# null 객체 패턴을 과용하면 클래스가 많아진다 (과도한 설계의 증상)
# 차라리 빈값으로 null 객체를 표현할 수 있는 방법을 적용한다

class AbstractAddress
  def city
  end
  
  def state
  end
  
  def zip
  end
end

class NullAddress < AbstractAddress
  def city
    ''
  end
  
  def state
    ''
  end
  
  def zip
    ''
  end
end

class RealAddress < AbstractAddress
  attr_reader :city, :state, :zip

  def initialize(city, state, zip)
    @city = city
    @state = state
    @zip = zip
  end
end

address = RealAddress.new('city', 'state', 'zip')
pp address
address = NullAddress.new
pp address

puts '------'

class Address
  attr_accessor :city, :state, :zip

  def initialize(city, state, zip)
    @city = city
    @state = state
    @zip = zip
  end
end

null_address = Address.new('', '', '') # null 객체를 대체할 수 있다
pp null_address
