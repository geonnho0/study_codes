module GrapeBase
  extend ActiveSupport::Concern

  included do
    helpers AccountsConcern, Pundit::Authorization

    rescue_from ActiveRecord::RecordNotFound, with: :not_found
    rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized
    rescue_from ActiveRecord::RecordInvalid, with: :bad_request

    helpers do
      def user_not_authorized(exception)
        pp exception
        policy_name = exception.policy.class.to_s.underscore

        errors = exception.record&.errors&.full_messages
        if errors.blank?
          errors = [I18n.t("#{policy_name}.#{exception.query}", scope: 'pundit',
                           default: [exception.query.to_sym, :default])]
        end
        error!({ errors: errors }, 403)
      end

      def not_found(exception)
        error!({ errors: [exception.message] }, 404)
      end

      def bad_request(exception)
        error!({ errors: [exception.message] }, 400)
      end
    end

    before do
      authenticate_user!
    end
  end
end
