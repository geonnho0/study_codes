module ExceptionHandler
  extend ActiveSupport::Concern

  included do
    rescue_from Exception do |exception|
      Rails.logger.error exception.message
      render json: { message: exception.message }, status: :internal_server_error
    end

    # TODO: 다른 공통 예외 처리 추가
  end
end
