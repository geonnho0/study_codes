module AccountsConcern
  extend ActiveSupport::Concern

  def authenticate_user!
    set_current_user_from_header(request.headers)
  end

  def current_user
    @current_user
  end

  private

  def set_current_user_from_header(header)
    @current_user = User.find(header["user"])
  end
end
