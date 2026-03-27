class Kodisha::UsersController < Kodisha::BaseController
  before_action :set_user, only: %i[show update destroy]
  allow_roles "admin", only: %i[index show update destroy set_landlord_profile]
  allow_roles "member", "admin", only: [ :create ]

  # GET /kodisha/users
  def index
    users = User.includes(:tenant_profile, :landlord_profile)
    render json: users
  end

  # GET /kodisha/users/:id
  def show
    render json: @user
  end

  # POST /kodisha/users
  def create
    user = User.create!(
      firstname: user_params[:firstname],
      lastname: user_params[:lastname],
      phonenumber: user_params[:phonenumber],
      password: SecureRandom.hex(10),
      email_address: user_params[:email_address],
    )
    profile = user.create_tenant_profile!

    if user.save && profile.persisted?
      render json: user,  serializer: Kodisha::UserCreatedSerializer, status: :created
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


  def set_user
    @user = User.find(params[:id])
  end

  # Strong parameters for creating/updating users

  def user_params
    permitted = %i[email_address password password_confirmation firstname lastname phonenumber]
    permitted << :role if current_user&.admin?
    params.require(:user).permit(permitted)
  end
end
