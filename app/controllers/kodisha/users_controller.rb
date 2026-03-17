class Kodisha::UsersController < Kodisha::BaseController
  before_action :set_user, only: %i[show update destroy]
  admin_access_only only: %i[index create update destroy set_landlord_profile]
  landlord_access only: %i[create]

  # GET /kodisha/users
  def index
    users = User.all
    render json: users
  end

  # GET /kodisha/users/:id
  def show
    render json: @user
  end

  # POST /kodisha/users
  def create
    user = User.new(user_params)
    profile = user.create_tenant_profile

    if user.save && profile.persisted?
      render json: user, status: :created
    else
      render json: { user_errors: user.errors.full_messages, profile_errors: profile.errors.full_messages }, status: :unprocessable_entity
    end
  end

  # PUT/PATCH /kodisha/users/:id
  def update
    if @user.update(user_params)
      render json: @user, status: :ok
    else
      render json: { errors: @user.errors.full_messages }, status: :unprocessable_entity
    end
  end
  def set_landlord_profile
    user = User.find(params[:id])

    if user.landlord_profile.present?
      return render json: { error: "Profile already exists" }, status: :unprocessable_entity
    end

    profile = user.create_landlord_profile

    if profile.persisted?
      user.update(role: "member")

      render json: { role: user.role, profile: profile }, status: :ok
    else
      render json: { errors: profile.errors.full_messages }, status: :unprocessable_entity
    end
  end
  # DELETE /kodisha/users/:id
  def destroy
    @user.destroy
    render json: { message: "User deleted" }, status: :ok
  end

  private


  # Loads a user based on params[:id]
  def set_user
    @user = User.find(params[:id])
  rescue ActiveRecord::RecordNotFound
    render json: { error: "User not found" }, status: :not_found
  end

  # Strong parameters for creating/updating users

  def user_params
    permitted = %i[email_address password password_confirmation firstname lastname phonenumber]
    permitted << :role if current_user&.admin?
    params.require(:user).permit(permitted)
  end
end
