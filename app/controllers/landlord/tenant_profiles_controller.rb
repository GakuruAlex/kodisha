class Landlord::TenantProfilesController < Kodisha::BaseController
  before_action :set_tenant_profile, only: %i[ show ]
  allow_roles "admin", "member", only: [ :create, :index ]

  def index
    tenant_profiles = TenantProfile.all
    render json: tenant_profiles
  end

  def show
    render json: @tenant_profile
  end

  def create
    tenant = User.create!(
      firstname: tenant_profile_params[:firstname],
      lastname: tenant_profile_params[:lastname],
      phonenumber: tenant_profile_params[:phonenumber],
      password: SecureRandom.hex(10),
      email_address: tenant_profile_params[:email_address],
    )
    if tenant.save
      tenant_profile = tenant.create_tenant_profile!
      render json: tenant_profile, status: :created
    else
      render json: { errors: tenant.errors.full_messages }, status: :unprocessable_entity
    end
  end

  private

  def set_tenant_profile
    @tenant_profile = TenantProfile.find(params[:id])
  end

  def tenant_profile_params
    perimitted = %i[firstname lastname phonenumber email_address]
    permitted << :role if current_user&.admin?
    params.require(:tenant_profile).permit(perimitted)
  end
end
