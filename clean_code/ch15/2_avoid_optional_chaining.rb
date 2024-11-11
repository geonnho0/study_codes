# 옵셔널 체이닝으로 null을 처리하는 것보다
# null을 발생하지 않도록 한다

class Credentials
  attr_reader :not_expired

  def initialize(not_expired)
    @not_expired = not_expired
  end
end

class User
  attr_reader :name, :credentials

  def initialize(name, credentials)
    @name = name
    @credentials = credentials
  end
end

# def print_if_not_expired(user)
#   if user&.credentials&.not_expired # 옵셔널 체이닝 (제거해야 함)
#     puts user.name
#   end
#   puts 'expired!'
# end
#
# credentials = Credentials.new(true)
# user = User.new('user name', nil)
# print_if_not_expired(user)

class NullCredentials
  def expired?
    true
  end
end

def print_if_not_expired(user)
  unless user.credentials.expired?
    puts user.name
  end
  puts 'expired'
end

credentials = NullCredentials.new
user = User.new('user name', credentials)
print_if_not_expired(user)