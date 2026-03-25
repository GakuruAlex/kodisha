module Authorization
  extend ActiveSupport::Concern

  # Role Based Access Control
  module ClassMethods
    def allow_roles(*roles, **options)
      before_action(**options) do
        unless roles.include?(current_user.role)
          render json: { error: "You are not authorized to access that resource" }, status: :forbidden

        end
      end
    end
  end
end
