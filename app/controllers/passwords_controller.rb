class PasswordsController < ApplicationController
  skip_before_action :authenticate_request, only: [ :create, :edit, :update ]

  # Request password reset
  def create
    user = User.find_by(email_address: params[:email_address])
    if user
      token = user.signed_id(purpose: :password_reset, expires_in: 15.minutes)
      PasswordsMailer.with(user: user, token: token).reset.deliver_later
    end

    render json: { message: "If the email exists, a reset link has been sent" }
  end

  # Check if token is valid
  def edit
    user = User.find_signed!(params[:token], purpose: :password_reset)
    render json: { message: "Token valid", email: user.email_address }
  rescue ActiveSupport::MessageVerifier::InvalidSignature
    render json: { error: "Invalid or expired token" }, status: :unauthorized
  end

  # Reset the password
  def update
    user = User.find_signed!(params[:token], purpose: :password_reset)
    if user.update(params.permit(:password, :password_confirmation))
      render json: { message: "Password has been reset" }, status: :ok
    else
      render json: { errors: user.errors.full_messages }, status: :unprocessable_entity
    end
  rescue ActiveSupport::MessageVerifier::InvalidSignature
    render json: { error: "Invalid or expired token" }, status: :unauthorized
  end
end
