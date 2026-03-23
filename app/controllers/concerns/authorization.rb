module Authorization
  extend ActiveSupport::Concern

  # Makes it easy to restrict actions to admins
  module ClassMethods
    def admin_access_only(**options)
      before_action(**options) do
        unless current_user&.admin?
          render json: { error: "Forbidden: Admins only Resource" }, status: :forbidden
        end
      end
    end
    def landlord_access(**options)
      before_action(**options) do
        unless current_user&.member?
          render json: { error: "Forbidden: Landlord only Resource" }, status: :forbidden
        end
      end
    end
  end
end
