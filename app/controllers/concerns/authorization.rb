module Authorization
  extend ActiveSupport::Concern

  # Makes it easy to restrict actions to admins
  module ClassMethods
    def admin_access_only(**options)
      # This block runs in the controller instance
      before_action(**options) do
        unless current_user&.admin?
          render json: { error: "Forbidden: Admins for Users Resources" }, status: :forbidden
        end
      end
    end
  end
end
