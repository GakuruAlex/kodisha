class UsersController < ApplicationController
  before_action :set_user, only: %i[show]
  def index
    @users = User.where(role: "guest").order("created_at DESC").limit(5)
  end
  def show
  end
  def new
    @user = User.new
  end
  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to new_session_url
    end
  end

  def update
  end

  def delete
  end

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:email_address, :password, :password_confirmation, :firstname, :lastname, :phonenumber)
  end
end
