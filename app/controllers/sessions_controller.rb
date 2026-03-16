class SessionsController < ApplicationController
  skip_before_action :authenticate_request, only: [ :create ]

  def create
    user = User.find_by(email_address: params[:email_address])

    if user&.authenticate(params[:password])
      token = JsonWebToken.encode(user_id: user.id)
      render json: { token: token, user: { id: user.id, email: user.email_address, role: user.role } }, status: :ok
    else
      render json: { error: "Invalid email or password" }, status: :unauthorized
    end
  end
end
