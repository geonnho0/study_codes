class FeedbackPolicy
  attr_reader :user, :feedback

  def initialize(user, feedback)
    @user = user
    @feedback = feedback
  end

  def show?
    true
  end

  def create?
    user.present?
  end

  def update?
    user == feedback.sender
  end

  def destroy?
    user == feedback.sender
  end
end
