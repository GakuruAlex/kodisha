class Kodisha::UsersController < Kodisha::BaseController
  before_action :set_user, only: %i[ show edit update destroy ]

  def index
    @users = User.all
  end

  def show
  end
  def new
    @user = User.new
  end
  def create
    @user = User.new(user_params)

    if @user.save
      redirect_to kodisha_users_path, notice: "User created"
    else
      render :new, status: :unprocessable_entity
    end
  end
  def edit
  end

  def update
    if @user.update(user_params)
      redirect_to kodisha_user_path(@user), status: :see_other, notice: "User has been updated"
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
  end

  private
  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:email_address, :password, :password_confirmation, :firstname, :lastname, :phonenumber)
  end
end
