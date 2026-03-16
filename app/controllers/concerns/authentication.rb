module Authentication
  extend ActiveSupport::Concern

  included do
    before_action :authenticate_request
  end

  # Checks if the user sent a valid token
  def authenticate_request
    header = request.headers["Authorization"]
    token = header&.split(" ")&.last
    begin
      decoded = JsonWebToken.decode(token)
    rescue StandardError => e
      Rails.logger.debug "JWT decode error: #{e.class}: #{e.message}"
      return render json: { error: "Unauthorized" }, status: :unauthorized
    end

    @current_user = User.find_by(id: decoded && decoded[:user_id])
    render json: { error: "Unauthorized" }, status: :unauthorized unless @current_user
  end
  # Helper to access the current user
  def current_user
    @current_user
  end
end
