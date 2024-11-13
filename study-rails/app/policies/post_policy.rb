class PostPolicy
  attr_reader :user, :post

  def initialize(user, post)
    @user = user
    @post = post
  end

  def show?
    true  # 모든 사용자가 게시물을 볼 수 있음
  end

  def create?
    user.present?  # 로그인된 사용자만 게시물을 생성할 수 있음
  end

  def update?
    user == post.user  # 게시물 작성자만 수정할 수 있음
  end

  def destroy?
    user == post.user  # 게시물 작성자만 삭제할 수 있음
  end
end
