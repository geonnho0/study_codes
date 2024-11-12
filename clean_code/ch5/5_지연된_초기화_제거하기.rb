# 지연된 초기화 : 객체를 실제로 필요할 때까지 생성하지 않고 지연시키는 것
# 장점 : 자원 사용을 최적화하고 성능을 개선하는 데 사용
# 하지만 여러 스레드가 동시에 객체에 접근 및 초기화를 할 수 있고, 동시성 문제 또는 경쟁 상태가 발생할 수 있다
# 또는, 여러 스레드가 교착 상태에 빠질 수도 있다

# class Employee
#   def emails
#     @emails ||= [] # 초기화 지연
#   end
#
#   def voice_mails
#     @voice_mails ||= [] # 초기화 지연
#   end
# end

# 위 방법의 지연된 초기화 메커니즘을 제거해야 한다

class Employee
  attr_reader :emails, :voice_mails

  def initialize
    @emails = []
    @voice_mails = []
  end
end

# 지연된 초기화는 일종의 섣부른 최적화가 될 수 있다
# 실제 성능 문제가 발생하면, 싱글턴 패턴보다 프록시 패턴, 퍼사드 패턴과 같은 디자인 패턴으로 극복해야 한다
