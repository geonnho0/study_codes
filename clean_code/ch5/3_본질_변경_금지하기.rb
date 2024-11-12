class Date
  def month=(month)
    @month = month
  end
end

date = Date.new
date.month = 4

# date 객체에 대한 참조는 상수이고,
# 항상 같은 날짜를 가리킨다
# 참조는 변경할 수 없고, date 객체 내부 상태를 변경하는 메소드는 없어야 한다

class Date
  # month 세터가 없음
end
